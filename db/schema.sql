-- Skill Sharing Giuristi AI — schema Postgres / Supabase
-- License: AGPL-3.0 (per il codice). Contenuti utente: CC-BY-SA-4.0.
--
-- Modello consolidato (vedi MHC-Work/_org/decision_log.md 2026-06-04):
--   - Niente login, niente identità verificata (trust dal gruppo WhatsApp)
--   - Niente moderation preventiva — submit = publish immediato
--   - skill: append-only (no UPDATE/DELETE)
--   - reviews + errors: edit-friendly via edit_token UUID inviato per email
--   - helpful_votes: idempotenti via fingerprint browser
--   - Rimozione di emergenza: dal proprietario tecnico via SQL (fuori workflow normale)
--
-- Apply tramite Supabase SQL Editor (Dashboard → SQL Editor → New query → paste → Run)

-- ============================================================
-- 1. ESTENSIONI
-- ============================================================
create extension if not exists "uuid-ossp";

-- ============================================================
-- 2. ENUM
-- ============================================================
do $$
begin
  if not exists (select 1 from pg_type where typname = 'edit_target_type') then
    create type edit_target_type as enum ('review', 'error');
  end if;
end$$;

-- ============================================================
-- 3. TABELLE
-- ============================================================

-- 3.1 skills (append-only by design — no UPDATE/DELETE policy)
create table if not exists skills (
  id uuid primary key default uuid_generate_v4(),
  slug text unique not null,
  title text not null,
  author_name text not null,
  anonymous boolean not null default false,
  area text not null,
  ai_compatibility text[] not null default '{}',
  description text not null,
  content text not null,
  github_url text,
  references_text text,
  created_at timestamptz not null default now()
);

create index if not exists skills_area_idx on skills(area);
create index if not exists skills_created_idx on skills(created_at desc);

-- 3.2 reviews (edit-friendly via edit_token)
create table if not exists reviews (
  id uuid primary key default uuid_generate_v4(),
  skill_id uuid not null references skills(id) on delete cascade,
  stars smallint not null check (stars between 1 and 5),
  text text not null,
  author_name text not null,
  anonymous boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz
);

create index if not exists reviews_skill_idx on reviews(skill_id);
create index if not exists reviews_created_idx on reviews(created_at desc);

-- 3.3 errors (edit-friendly via edit_token)
create table if not exists errors (
  id uuid primary key default uuid_generate_v4(),
  slug text unique not null,
  title text not null,
  ai_tool text not null,
  area text not null,
  author_name text not null,
  anonymous boolean not null default false,
  description text not null,
  prompt text not null,
  wrong_answer text not null,
  correction text not null,
  references_text text,
  reported_count integer not null default 1,
  created_at timestamptz not null default now(),
  updated_at timestamptz
);

create index if not exists errors_area_idx on errors(area);
create index if not exists errors_ai_idx on errors(ai_tool);
create index if not exists errors_created_idx on errors(created_at desc);

-- 3.4 helpful_votes (idempotenti via fingerprint browser)
create table if not exists helpful_votes (
  review_id uuid not null references reviews(id) on delete cascade,
  voter_fingerprint text not null,
  created_at timestamptz not null default now(),
  primary key (review_id, voter_fingerprint)
);

create index if not exists helpful_votes_review_idx on helpful_votes(review_id);

-- 3.5 edit_tokens
create table if not exists edit_tokens (
  token uuid primary key default uuid_generate_v4(),
  target_type edit_target_type not null,
  target_id uuid not null,
  email_recipient text not null,
  created_at timestamptz not null default now(),
  expires_at timestamptz not null default (now() + interval '365 days'),
  revoked boolean not null default false
);

create index if not exists edit_tokens_target_idx on edit_tokens(target_type, target_id);

-- ============================================================
-- 4. ROW LEVEL SECURITY (RLS)
-- ============================================================
-- Pattern: chiunque legge (anon), chiunque scrive (anon), nessuno modifica
-- direttamente via REST. Le UPDATE/DELETE passano dalle Edge Functions
-- service-role che verificano il token prima.

alter table skills enable row level security;
alter table reviews enable row level security;
alter table errors enable row level security;
alter table helpful_votes enable row level security;
alter table edit_tokens enable row level security;

-- 4.1 SELECT pubblico per skills/reviews/errors
drop policy if exists "skills_select_public" on skills;
create policy "skills_select_public" on skills for select using (true);

drop policy if exists "reviews_select_public" on reviews;
create policy "reviews_select_public" on reviews for select using (true);

drop policy if exists "errors_select_public" on errors;
create policy "errors_select_public" on errors for select using (true);

-- helpful_votes: aggregate via view (vedi sotto), no SELECT individuale necessario
-- ma serve INSERT pubblico
drop policy if exists "helpful_votes_select_public" on helpful_votes;
create policy "helpful_votes_select_public" on helpful_votes for select using (true);

-- 4.2 INSERT pubblico per skills/reviews/errors/helpful_votes
-- (gli INSERT vanno via Edge Function `submit-with-email`, che usa service role —
--  ma se la Edge Function fallisce, il client può anche provare direct insert
--  come fallback. Permettiamo INSERT diretto per evitare blocco totale.)
drop policy if exists "skills_insert_public" on skills;
create policy "skills_insert_public" on skills for insert with check (true);

drop policy if exists "reviews_insert_public" on reviews;
create policy "reviews_insert_public" on reviews for insert with check (true);

drop policy if exists "errors_insert_public" on errors;
create policy "errors_insert_public" on errors for insert with check (true);

drop policy if exists "helpful_votes_insert_public" on helpful_votes;
create policy "helpful_votes_insert_public" on helpful_votes for insert with check (true);

-- 4.3 NIENTE policy UPDATE/DELETE per ruolo anon. Le mutations vanno sempre
--     dalla Edge Function `edit-via-token` che opera con service_role
--     (bypassa RLS) dopo aver verificato il token.

-- edit_tokens: nessuna policy pubblica (le query passano dalla Edge Function)

-- ============================================================
-- 5. VIEW per helpful counts aggregati
-- ============================================================
create or replace view review_helpful_counts as
select
  review_id,
  count(*)::integer as count
from helpful_votes
group by review_id;

-- ============================================================
-- 6. TRIGGER per updated_at su reviews / errors
-- ============================================================
create or replace function touch_updated_at() returns trigger as $$
begin
  new.updated_at = now();
  return new;
end
$$ language plpgsql;

drop trigger if exists reviews_touch_updated_at on reviews;
create trigger reviews_touch_updated_at
  before update on reviews
  for each row execute function touch_updated_at();

drop trigger if exists errors_touch_updated_at on errors;
create trigger errors_touch_updated_at
  before update on errors
  for each row execute function touch_updated_at();

-- ============================================================
-- Fine schema. Esegui ora db/seed.sql per popolare con dati mock iniziali.
-- ============================================================

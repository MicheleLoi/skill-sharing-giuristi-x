-- Aggiunge submission_mode + license + original_author_name + tool_url a skills
-- submission_mode: 'self' | 'colleague' | 'external'
--   - self: skill propria
--   - colleague: skill di un collega del gruppo (autorizzato)
--   - external: skill o prompt visto altrove (autore terzo, non del gruppo)
-- license: 1 of 10 values (vedi catalog in frontend); default CC-BY-SA-4.0
-- original_author_name: per modalita' colleague (autore originale del collega) o external (autore terzo)
-- tool_url: per modalita' external (link alla fonte esterna)
--
-- SID-20260604-152531 — pacchetto ratificato post-strategist (3 modalita' submission + 10 licenze).
-- Vedi MHC-Work/_org/decision_log.md 2026-06-04.

alter table skills add column if not exists submission_mode text not null default 'self'
  check (submission_mode in ('self', 'colleague', 'external'));

alter table skills add column if not exists license text not null default 'CC-BY-SA-4.0'
  check (license in (
    'CC-BY-SA-4.0',
    'CC-BY-4.0',
    'CC-BY-NC-4.0',
    'CC0-1.0',
    'Proprietary',
    'MIT',
    'Apache-2.0',
    'GPL-3.0',
    'AGPL-3.0',
    'TBD'
  ));

alter table skills add column if not exists original_author_name text;
alter table skills add column if not exists tool_url text;

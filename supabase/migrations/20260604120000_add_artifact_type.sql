-- Skill Sharing Giuristi AI — migration: aggiunge skills.artifact_type
--
-- Contesto (vedi MHC-Work/_org/decision_log.md 2026-06-04 §"Skill Sharing Giuristi AI"):
-- La chat WhatsApp del gruppo Giuristi AI mostra uso fluido di "skill", "prompt",
-- "instructions", "claude.md", "preferenze utente" come quasi-sinonimi. Una tab
-- unica "Skill e prompt" rispetta l'uso reale; un facet opzionale "Tipo di
-- artefatto" permette categorizzazione emergente (5 valori: prompt-libero,
-- skill-md, claude-md, orchestrazione-mcp, altro). Campo nullable: append-only
-- vecchie entry restano valide senza tag.
--
-- Apply: Supabase Dashboard → SQL Editor → New query → paste → Run.
--        (oppure: supabase db push --linked se la CLI è autenticata + Docker attivo)

alter table skills
  add column if not exists artifact_type text;

-- Index opzionale per filtraggio facet veloce sul prototipo
create index if not exists skills_artifact_type_idx on skills(artifact_type)
  where artifact_type is not null;

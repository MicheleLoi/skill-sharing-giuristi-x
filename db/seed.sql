-- Seed mock evidente: 3 skill + 3 errori, contenuti lorem ipsum, autori pseudo Recode-IT
-- Scopo: rendere chiaro che il prototipo è DIMOSTRATIVO, non contiene contenuti utili
-- Pseudo persone da Recode-IT/src/engine/pools.ts PERSON_POOL_ANONYMIZE_PY

-- ============================================================
-- CLEANUP (idempotente: pulisce eventuale precedente seed o test)
-- ============================================================
delete from edit_tokens;
delete from helpful_votes;
delete from reviews;
delete from skills;
delete from errors;

-- ============================================================
-- SKILLS (3 mock)
-- ============================================================

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'lorem-skill-civile-001',
  'Lorem ipsum skill — area civile',
  'Avv. Tizio',
  false,
  'civile',
  ARRAY['Claude']::text[],
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  '---
name: lorem-skill-civile-001
description: Lorem ipsum descriptive placeholder for demo skill.
when_to_use: Lorem ipsum trigger condition placeholder.
---

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

Quando l''avvocato ti fornisce:
- lorem ipsum dolor sit amet
- consectetur adipiscing elit
- sed do eiusmod tempor incididunt

Produci:
1. Lorem ipsum primum
2. Sed do eiusmod secundum
3. Ut labore tertium

Marca con [VERIFICA] ogni passaggio che richiede controllo formale.

NON inventare contenuti reali — questo è solo un esempio dimostrativo.',
  NULL,
  'Lorem ipsum normattiva [VERIFICA]'
);

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'lorem-skill-penale-002',
  'Lorem ipsum skill — area penale',
  'Avv. Caio',
  false,
  'penale',
  ARRAY['Claude', 'ChatGPT']::text[],
  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.',
  '---
name: lorem-skill-penale-002
description: Lorem ipsum demo skill placeholder.
when_to_use: Lorem ipsum invocation condition placeholder.
---

Sei assistente di uno studio penalista in modalità dimostrativa.

Lorem ipsum dolor sit amet, consectetur adipiscing elit:
- ut enim ad minim veniam
- quis nostrud exercitation
- ullamco laboris nisi

Esegui i seguenti passi (placeholder):
1. Lorem ipsum analisi
2. Dolor sit amet inquadramento
3. Consectetur adipiscing elit conclusione

NON inventare giurisprudenza. Questo è un esempio dimostrativo senza contenuto reale.',
  'https://github.com/example/lorem-skill-penale',
  'Lorem ipsum giurisprudenza [VERIFICA]'
);

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'lorem-skill-lavoro-003',
  'Lorem ipsum skill — area lavoro',
  'Avv. Calpurnio',
  true,
  'lavoro',
  ARRAY['Claude']::text[],
  'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores.',
  '---
name: lorem-skill-lavoro-003
description: Lorem ipsum placeholder skill, demo only.
when_to_use: Lorem ipsum lorem trigger placeholder.
---

Lorem ipsum dolor sit amet, consectetur adipiscing elit.

Chiedi all''avvocato (uno per volta):
1. Lorem ipsum primum
2. Dolor sit amet secundum
3. Consectetur tertium

Poi produci:
- Lorem ipsum output placeholder
- Sed do eiusmod marca [VERIFICA]
- Ut labore et dolore segnala [DUBBIO]

NON è una skill reale — placeholder dimostrativo.',
  NULL,
  NULL
);

-- ============================================================
-- REVIEWS (8 totali, distribuite sui 3 skill)
-- ============================================================

-- Reviews per lorem-skill-civile-001 (4)
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values
  ((select id from skills where slug = 'lorem-skill-civile-001'), 5, 'Lorem ipsum dolor sit amet — recensione dimostrativa molto positiva placeholder.', 'Avv. Sempronio', false, '2026-05-28T12:00:00Z'),
  ((select id from skills where slug = 'lorem-skill-civile-001'), 4, 'Lorem ipsum consectetur adipiscing elit — recensione media placeholder.', 'Avv. Cornelia', false, '2026-05-22T12:00:00Z'),
  ((select id from skills where slug = 'lorem-skill-civile-001'), 3, 'Lorem ipsum sed do eiusmod — recensione neutrale anonima placeholder.', 'Avv. Flavio', true, '2026-05-15T12:00:00Z'),
  ((select id from skills where slug = 'lorem-skill-civile-001'), 5, 'Lorem ipsum ut labore — terza opinione positiva placeholder.', 'Avv. Lucrezia', false, '2026-05-10T12:00:00Z');

-- Reviews per lorem-skill-penale-002 (2)
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values
  ((select id from skills where slug = 'lorem-skill-penale-002'), 4, 'Lorem ipsum dolor sit amet placeholder — recensione positiva.', 'Avv. Servio', false, '2026-05-30T12:00:00Z'),
  ((select id from skills where slug = 'lorem-skill-penale-002'), 2, 'Lorem ipsum criticismo dimostrativo — anonima per ragione plausibile.', 'Avv. Porzia', true, '2026-05-20T12:00:00Z');

-- Reviews per lorem-skill-lavoro-003 (2)
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values
  ((select id from skills where slug = 'lorem-skill-lavoro-003'), 5, 'Lorem ipsum recensione dimostrativa molto positiva placeholder.', 'Avv. Tullio', false, '2026-05-25T12:00:00Z'),
  ((select id from skills where slug = 'lorem-skill-lavoro-003'), 3, 'Lorem ipsum recensione neutrale placeholder dimostrativa.', 'Avv. Attilia', false, '2026-05-18T12:00:00Z');

-- ============================================================
-- ERRORI (3 mock)
-- ============================================================

insert into errors (slug, title, ai_tool, area, author_name, anonymous, description, prompt, wrong_answer, correction, references_text, reported_count, created_at) values (
  'lorem-errore-claude-001',
  'Lorem ipsum errore — esempio dimostrativo Claude',
  'Claude',
  'civile',
  'Avv. Mevio',
  false,
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit — descrizione errore placeholder.',
  'Lorem ipsum dolor sit amet? Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore?',
  'Lorem ipsum allucinazione dimostrativa: Cass. n. 99999/2099 inesistente, principio inventato, riferimento normativo fabbricato.',
  'Lorem ipsum correzione: l''errore consiste in placeholder. La risposta corretta sarebbe lorem ipsum dolor sit amet, con riferimento a [VERIFICA fonte].',
  'Lorem ipsum normativa [VERIFICA]',
  3,
  '2026-05-30T12:00:00Z'
);

insert into errors (slug, title, ai_tool, area, author_name, anonymous, description, prompt, wrong_answer, correction, references_text, reported_count, created_at) values (
  'lorem-errore-chatgpt-002',
  'Lorem ipsum errore — esempio dimostrativo ChatGPT',
  'ChatGPT',
  'tributario',
  'Avv. Decio',
  true,
  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem — descrizione anonima.',
  'Lorem ipsum prompt placeholder? Quale aliquota lorem ipsum si applica?',
  'Lorem ipsum risposta sbagliata: aliquota placeholder, calcolo errato dimostrativo.',
  'Lorem ipsum correzione: la cifra corretta è placeholder. ChatGPT confonde parametri demo.',
  'Lorem ipsum riferimento fiscale [VERIFICA]',
  2,
  '2026-05-22T12:00:00Z'
);

insert into errors (slug, title, ai_tool, area, author_name, anonymous, description, prompt, wrong_answer, correction, references_text, reported_count, created_at) values (
  'lorem-errore-gemini-003',
  'Lorem ipsum errore — esempio dimostrativo Gemini',
  'Gemini',
  'amministrativo',
  'Avv. Filano',
  false,
  'Nemo enim ipsam voluptatem quia voluptas — descrizione errore placeholder dimostrativo.',
  'Lorem ipsum quali requisiti normativi per placeholder?',
  'Lorem ipsum articolo inventato: art. 999-bis del Codice fittizio, dispositivo placeholder.',
  'Lorem ipsum correzione: l''articolo non esiste. La disciplina corretta è placeholder con riferimento a [VERIFICA fonte ufficiale].',
  'Lorem ipsum normativa amministrativa [VERIFICA]',
  1,
  '2026-05-15T12:00:00Z'
);

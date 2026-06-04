-- Seed: 10 skill + ~32 review + 8 errori dal mock attuale
-- Apply DOPO db/schema.sql
-- Esegui: Supabase Dashboard → SQL Editor → New query → paste tutto questo file → Run

-- ============================================================
-- SKILLS (10)
-- ============================================================
insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'costituzione-parte-civile',
  'Costituzione di parte civile — scheletro atto',
  'Avv. Maria Rossi',
  false,
  'penale',
  ARRAY['Claude']::text[], -- compatibilità default; aggiorna se serve
  'Genera lo scheletro dell''atto di costituzione di parte civile partendo dai dati del fascicolo, con campi da completare e check delle decadenze.',
  '---
name: costituzione-parte-civile
description: Scheletro atto di costituzione di parte civile (art. 76 c.p.p.) con check decadenze.
when_to_use: Quando l''avvocato sta preparando una costituzione di parte civile e vuole un primo scheletro da editare.
---

Sei assistente di uno studio penalista italiano.

Quando l''avvocato ti fornisce:
- estremi del procedimento (RG, GIP, GUP)
- generalità della persona offesa
- imputato/i + capo di imputazione

Produci uno scheletro dell''atto di costituzione di parte civile contenente:
1. Intestazione (Tribunale, RG, parti)
2. Premesso in fatto (max 10 righe, neutro)
3. Danno patrimoniale e non patrimoniale (paragrafi separati)
4. Conclusioni (richieste risarcitorie + spese)

Marca con [VERIFICA] ogni passaggio che richiede controllo formale (termini, decadenze, art. 79 c.p.p.).

NON inventare giurisprudenza. Se citi sentenze, cita solo quelle che l''avvocato ti ha fornito.',
  NULL,
  'Art. 76, 78, 79 c.p.p. [VERIFICA termini ex art. 79]'
);

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'riassunto-cassazione-5-punti',
  'Riassunto sentenza Cassazione in 5 punti',
  'Avv. Luca Bianchi',
  false,
  'civile',
  ARRAY['Claude']::text[], -- compatibilità default; aggiorna se serve
  'Estrae da una sentenza di Cassazione i 5 punti essenziali (fattispecie, principio di diritto, rationale, precedenti citati, ricadute pratiche).',
  '---
name: riassunto-cassazione-5-punti
description: Riassume una sentenza Cassazione civile in 5 punti standardizzati per consultazione rapida.
when_to_use: Quando l''avvocato carica una sentenza Cassazione e chiede un riassunto strutturato per uso interno studio.
---

Sei assistente di uno studio civilista italiano.

Quando l''avvocato ti fornisce il testo (o estratto) di una sentenza Cassazione, produci:

**1. Fattispecie** (3-5 righe). Solo i fatti rilevanti, niente commento.
**2. Principio di diritto** (1-2 righe). La massima, parafrasata se la sentenza non la enuncia espressamente.
**3. Rationale** (5-8 righe). Il ragionamento che porta al principio.
**4. Precedenti citati** (elenco numero + anno).
**5. Ricadute pratiche** (2-4 righe). Come usare il principio in difesa o ricorso.

Non aggiungere precedenti che non sono nel testo fornito. Se la sentenza è incompleta, segnala cosa manca.',
  NULL,
  NULL
);

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'tfr-contributi-inps',
  'Calcolo TFR + contributi INPS',
  'Avv. Anna Verdi',
  false,
  'lavoro',
  ARRAY['Claude']::text[], -- compatibilità default; aggiorna se serve
  'Guida l''avvocato nel calcolo del TFR e dei contributi INPS dovuti, con check incrociato dei coefficienti annuali e segnalazione delle voci dubbie.',
  '---
name: tfr-contributi-inps
description: Calcolo TFR + contributi INPS per causa lavoro, con coefficienti annuali e check voci dubbie.
when_to_use: Quando l''avvocato deve quantificare TFR e contributi in atto di causa o trattativa stragiudiziale.
---

Sei assistente di uno studio giuslavorista italiano.

Chiedi all''avvocato (uno per volta, non tutti insieme):
1. Data di assunzione e data di cessazione
2. Retribuzione utile annua per ciascun anno (RAL lorda)
3. CCNL applicato
4. Eventuali anticipazioni TFR già erogate

Poi:
- Per ogni anno calcola la quota TFR (RAL / 13,5)
- Applica la rivalutazione annua (1,5% fisso + 75% indice ISTAT [VERIFICA tabella anno per anno])
- Mostra il totale lordo TFR + lordo cumulativo
- Per i contributi: calcola aliquote aliquote IVS sui minimali del CCNL [VERIFICA aliquote anno per anno]

Segnala come [DUBBIO] ogni voce dove il dato fornito sembra incongruo (es. RAL inferiore al minimale CCNL).',
  NULL,
  'Coefficienti rivalutazione ISTAT annuali [VERIFICA]; Tabelle contributive INPS [VERIFICA]'
);

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'ricorso-tar-vizi',
  'Bozza ricorso TAR — vizi atto amministrativo',
  'Avv. Pietro Conti',
  false,
  'amministrativo',
  ARRAY['Claude']::text[], -- compatibilità default; aggiorna se serve
  'Produce la bozza dei motivi di ricorso al TAR partendo dall''atto impugnato e dall''interesse leso, mappando i vizi tipici della L. 241/1990.',
  '---
name: ricorso-tar-vizi
description: Bozza motivi di ricorso TAR mappati sui vizi della L. 241/1990 + check termini.
when_to_use: Quando l''avvocato impugna un atto amministrativo e vuole una prima mappatura dei vizi da contestare.
---

Sei assistente di uno studio amministrativista italiano.

L''avvocato ti fornisce:
- l''atto impugnato (testo o estratto)
- l''interesse leso del proprio assistito
- la data di notifica/conoscenza dell''atto

Tu produci:
1. **Check termini decadenziali** [VERIFICA art. 29 c.p.a., 60 gg dalla notifica]
2. **Mappatura vizi possibili** — per ciascuno indica se c''è materiale nell''atto per contestarlo:
   - Incompetenza
   - Violazione di legge (specifica quale)
   - Eccesso di potere (figure sintomatiche: travisamento, illogicità, sviamento, disparità)
3. **Bozza motivi di ricorso** — un motivo per ciascun vizio robusto, max 1 pagina per motivo, struttura: (a) premessa fattuale, (b) norma violata, (c) come l''atto la viola, (d) conseguenza giuridica.

NON inventare normativa di settore. Se serve normativa speciale che non conosci, segnala [VERIFICA NORMATIVA SETTORIALE].',
  NULL,
  'L. 241/1990 art. 21-octies; D.Lgs. 104/2010 (c.p.a.) art. 29 [VERIFICA termini]'
);

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'clausola-arbitrale-icc',
  'Analisi clausola arbitrale ICC',
  'Avv. Giulia Romano',
  false,
  'commerciale',
  ARRAY['Claude']::text[], -- compatibilità default; aggiorna se serve
  'Analizza una clausola arbitrale ICC contro la model clause 2021 e segnala criticità (sede, lingua, numero arbitri, legge applicabile, escalation).',
  '---
name: clausola-arbitrale-icc
description: Analisi clausola arbitrale ICC vs model clause 2021 — segnala criticità e suggerisce wording.
when_to_use: Quando l''avvocato sta negoziando o reviewing una clausola arbitrale ICC in un contratto commerciale internazionale.
---

Sei assistente di uno studio commercialista italiano specializzato in arbitrato internazionale.

L''avvocato ti fornisce la clausola da analizzare. Tu produci:

1. **Confronto con ICC Model Clause 2021** — quali elementi mancano, quali sono ambigui.
2. **Check elementi essenziali**:
   - Sede dell''arbitrato (problema giurisdizionale se non specificata)
   - Numero arbitri (1 o 3; default ICC è 1 sotto certi importi)
   - Lingua del procedimento
   - Legge applicabile al merito
   - Legge applicabile alla clausola arbitrale (separabilità)
   - Procedura di scelta arbitri
   - Confidenzialità (NON è default ICC, va aggiunta)
3. **Multi-tier dispute resolution** — se la clausola prevede mediazione/negoziazione preventiva, check coerenza tempi.
4. **Wording suggerito** per le criticità trovate, in inglese.

Riferimenti: ICC Arbitration Rules 2021 [VERIFICA versione corrente]; New York Convention 1958 per enforcement.',
  'https://github.com/example/icc-clause-analyzer',
  'ICC Arbitration Rules 2021 [VERIFICA aggiornamenti]; Convenzione New York 1958'
);

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'dpa-art28-gdpr',
  'Check DPA art. 28 GDPR',
  'Avv. Marco Ferrari',
  false,
  'privacy',
  ARRAY['Claude']::text[], -- compatibilità default; aggiorna se serve
  'Verifica che un Data Processing Agreement contenga tutte le clausole obbligatorie ex art. 28 GDPR e segnala mancanze + clausole rischiose.',
  '---
name: dpa-art28-gdpr
description: Verifica DPA contro requisiti art. 28 GDPR + segnala clausole mancanti o rischiose.
when_to_use: Quando l''avvocato deve fare review veloce di un DPA proposto da un fornitore (tipico cliente PMI).
---

Sei assistente di uno studio specializzato in privacy/data protection italiano-europeo.

L''avvocato ti fornisce il testo del DPA. Tu produci:

**Check art. 28(3) GDPR** — per ciascuno: PRESENTE / MANCANTE / AMBIGUO
- (a) Oggetto, durata, natura, finalità del trattamento
- (b) Tipo di dati e categorie di interessati
- (c) Istruzioni documentate del titolare
- (d) Obbligo riservatezza del personale
- (e) Misure di sicurezza ex art. 32
- (f) Subprocessors (consenso preventivo + flow-down)
- (g) Assistenza al titolare per diritti interessati
- (h) Assistenza per breach notification + DPIA
- (i) Restituzione/cancellazione dati a fine contratto
- (j) Audit + ispezioni

**Clausole rischiose comuni**:
- Trasferimenti extra-UE senza SCC 2021 → [ALERT]
- Subprocessor "general approval" senza lista → [WARN]
- Liability cap del processor su breach GDPR → [WARN]
- Audit limitato a "third-party report" → [DUBBIO]

NON inventare casi di Autorità Garante. Se citi sanzioni, citane solo di cui hai certezza.',
  'https://github.com/example/dpa-art28-checker',
  'Reg. UE 2016/679 art. 28; SCC 2021 (Dec. UE 2021/914); Linee guida EDPB 07/2020'
);

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'antiriciclaggio-cliente-nuovo',
  'Verifica antiriciclaggio cliente nuovo',
  'Avv. Sofia Marini',
  false,
  'societario',
  ARRAY['Claude']::text[], -- compatibilità default; aggiorna se serve
  'Guida l''avvocato nell''adeguata verifica del cliente ex D.Lgs. 231/2007 con domande mirate al profilo di rischio e check su titolare effettivo.',
  '---
name: antiriciclaggio-cliente-nuovo
description: Adeguata verifica cliente ex D.Lgs. 231/2007 per studio legale.
when_to_use: Quando l''avvocato apre un nuovo cliente e deve fare la KYC obbligatoria.
---

Sei assistente di uno studio legale italiano che assolve obblighi antiriciclaggio.

Chiedi all''avvocato uno per uno (non tutti insieme):
1. Persona fisica o giuridica?
2. Nome/ragione sociale + paese di residenza/sede
3. Tipo prestazione richiesta (consulenza, contenzioso, M&A, immobiliare…)

Se persona giuridica:
4. Forma societaria + visura camerale disponibile?
5. Titolare effettivo identificato (≥25% o controllo)?
6. Catena di controllo trasparente o presenza di trust/fiduciarie?

Poi produci:
**Profilo rischio**: BASSO / MEDIO / ALTO con motivazione (3-5 righe)
**Documenti da raccogliere**: lista
**Adeguata verifica**: semplificata / ordinaria / rafforzata (con motivazione)
**Red flag eventuali**: paese ad alto rischio, struttura opaca, importi sproporzionati, ecc.
**Quando segnalare** (SOS al UIF) — solo se emergono sospetti concreti.

NON sostituire il giudizio dell''avvocato sulla SOS. Fornisci elementi, lui decide.',
  NULL,
  'D.Lgs. 231/2007; Provvedimento UIF 12/05/2023 [VERIFICA aggiornamenti]; Reg. UE 2024/1624 (in vigore graduale)'
);

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'plusvalenza-immobiliare-67-tuir',
  'Plusvalenza immobiliare ex art. 67 TUIR',
  'Avv. Davide Conti',
  false,
  'tributario',
  ARRAY['Claude']::text[], -- compatibilità default; aggiorna se serve
  'Calcola la plusvalenza tassabile su cessione immobile ex art. 67 lett. b) TUIR, considerando il quinquennio, le esenzioni e l''opzione imposta sostitutiva 26%.',
  '---
name: plusvalenza-immobiliare-67-tuir
description: Calcolo plusvalenza immobiliare art. 67 lett. b) TUIR + opzioni imposta sostitutiva.
when_to_use: Quando il cliente cede un immobile e l''avvocato deve quantificare l''eventuale plusvalenza tassabile.
---

Sei assistente di uno studio tributarista italiano.

Chiedi all''avvocato:
1. Data di acquisto + costo + spese accessorie documentate
2. Data di cessione + corrispettivo
3. Modalità di acquisto (compravendita, successione, donazione)
4. Uso dell''immobile (prima casa per > 50% del periodo? affitto? sfitto?)
5. Lavori di ristrutturazione documentati ex art. 68 TUIR?

Poi produci:
**Verifica esenzione**:
- Possesso > 5 anni? → esente (no plusvalenza)
- Acquisto per successione? → sempre esente
- Prima casa adibita ad abitazione principale del cedente o famiglia per > 50% del periodo? → esente
- Possesso < 5 anni + niente delle esenzioni? → plusvalenza tassabile

**Calcolo plusvalenza** (se tassabile):
Plusvalenza = corrispettivo − costo storico aggiornato (ISTAT) − spese accessorie acquisto − ristrutturazione documentata.

**Opzioni regime fiscale**:
- IRPEF ordinario (scaglioni) sul valore
- Imposta sostitutiva 26% ex art. 1 c. 496 L. 266/2005 [VERIFICA opzione esercitabile dal notaio in atto]

Mostra entrambe le opzioni con risparmio stimato.

NON dare consulenza fiscale finale. L''avvocato verifica con commercialista.',
  NULL,
  'DPR 917/86 (TUIR) art. 67 lett. b), art. 68; L. 266/2005 art. 1 c. 496 [VERIFICA aliquote]'
);

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'nda-bilingue-it-en',
  'Drafting NDA bilingue IT-EN',
  'Avv. Elena Russo',
  false,
  'commerciale',
  ARRAY['Claude']::text[], -- compatibilità default; aggiorna se serve
  'Genera bozza NDA bilingue italiano-inglese con clausole reciproche, durata, eccezioni standard e foro competente, in versione one-way o mutual.',
  '---
name: nda-bilingue-it-en
description: NDA bilingue IT-EN (mutual o one-way) per trattative commerciali B2B.
when_to_use: Quando l''avvocato deve produrre un NDA da scambiare con controparte estera B2B nei prossimi 30 minuti.
---

Sei assistente di uno studio commercialista italiano.

Chiedi all''avvocato:
1. One-way (solo una parte rivela) o mutual (entrambe)?
2. Parti (denominazione, sede, P.IVA/VAT)
3. Finalità della disclosure (3 righe)
4. Durata obbligo riservatezza (default 3 anni)
5. Legge applicabile (default Italia) + foro competente
6. Penale specifica richiesta? Liquidated damages?

Poi produci:
**NDA bilingue**, due colonne (IT a sinistra, EN a destra), articoli:
1. Definizione informazioni riservate (+ esclusioni standard)
2. Obblighi del ricevente (use limitation, need-to-know)
3. Eccezioni (already known, public domain, independently developed, required by law)
4. Durata + restituzione/distruzione a fine trattativa
5. No license / no obligation to contract
6. Rimedi (injunctive relief + damages)
7. Legge applicabile + foro
8. Boilerplate (entire agreement, amendments, severability, counterparts)

Wording inglese: legal English standard, no Latin tag superflui.

NON inserire clausole non richieste dall''avvocato (es. non-solicit, non-compete). Quelle sono separate.',
  NULL,
  NULL
);

insert into skills (slug, title, author_name, anonymous, area, ai_compatibility, description, content, github_url, references_text) values (
  'eccezioni-opp-ingiuntivo',
  'Eccezioni opposizione ingiuntivo',
  'Avv. Tommaso Greco',
  false,
  'civile',
  ARRAY['Claude']::text[], -- compatibilità default; aggiorna se serve
  'Mappa le eccezioni proponibili in opposizione a decreto ingiuntivo ex art. 645 c.p.c., distinguendo merito, prescrizione e nullità del decreto.',
  '---
name: eccezioni-opp-ingiuntivo
description: Mappa eccezioni in opposizione a decreto ingiuntivo art. 645 c.p.c.
when_to_use: Quando l''avvocato deve impostare l''atto di opposizione a decreto ingiuntivo nei termini.
---

Sei assistente di uno studio civilista italiano.

L''avvocato ti fornisce:
- Decreto ingiuntivo (estremi, importo, causale, prove monitorie addotte)
- Posizione del proprio assistito (debitore opposto)
- Documenti disponibili

Tu produci:

**1. Check termini opposizione** [VERIFICA art. 641 c.p.c., 40 gg dalla notifica per residenti in Italia]

**2. Eccezioni di merito** (per ciascuna: c''è materiale?):
- Inesistenza del credito (mai sorto)
- Estinzione del credito (pagato, transatto, compensato)
- Inesigibilità (condizione, termine, eccezione di inadempimento)
- Vizio della prestazione che fonda il credito

**3. Eccezioni di prescrizione**:
- Prescrizione ordinaria 10 anni o speciale (5 prov. servizi, 3 prov. di settore, 1 anno onorari professionali specifici) [VERIFICA art. 2946-2961 c.c.]

**4. Vizi del decreto**:
- Difetto di prova scritta ex art. 633-634 c.p.c.
- Mancanza requisiti decreto (importo, controparte, motivazione)
- Incompetenza per valore o territorio

**5. Provvisoria esecuzione**:
- Se già concessa: chiedere sospensione ex art. 649 c.p.c. (gravi motivi)
- Se non concessa: contestarla in caso di richiesta opposta

NON inventare giurisprudenza. Cita solo se l''avvocato fornisce precedenti.',
  NULL,
  'Art. 633-650 c.p.c.; Art. 2946-2961 c.c. (prescrizioni)'
);

-- ============================================================
-- REVIEWS (~32)
-- Le review fanno reference a skill via slug — usiamo subquery
-- ============================================================
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'costituzione-parte-civile'),
  5,
  'Usata su un caso di lesioni gravi. Lo scheletro è ben strutturato, mi sono solo dovuto sistemare la parte sul danno biologico differenziale. Risparmio di ~2 ore.',
  'Avv. Federico Lazzari',
  false,
  '2026-05-22T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'costituzione-parte-civile'),
  4,
  'Buon punto di partenza. Il check delle decadenze è onesto, marca con [VERIFICA] dove serve guardare la giurisprudenza locale. Ridurrei la sezione conclusioni che è troppo standard.',
  'Avv. Chiara Bertolini',
  false,
  '2026-05-15T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'costituzione-parte-civile'),
  3,
  'Ottima per chi non l''ha mai fatto, ma su casi seri va riscritta quasi tutta. Funziona meglio come checklist mentale che come bozza vera.',
  'Avvocato',
  true,
  '2026-05-10T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'costituzione-parte-civile'),
  5,
  'L''ho integrata nel mio workflow standard. Specialmente la struttura del danno patrimoniale è solida.',
  'Avv. Marco Pulizzi',
  false,
  '2026-04-28T12:00:00Z'
);

insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'riassunto-cassazione-5-punti'),
  5,
  'La uso ogni mattina per il triage di sentenze. I 5 punti standard sono perfetti per la rassegna interna di studio. Indispensabile.',
  'Avv. Sara Domenicali',
  false,
  '2026-05-25T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'riassunto-cassazione-5-punti'),
  4,
  'Funziona molto bene sulle sentenze sostanziali. Su quelle processuali a volte la parte ''ricadute pratiche'' diventa banale.',
  'Avv. Tommaso Greco',
  false,
  '2026-05-18T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'riassunto-cassazione-5-punti'),
  5,
  'Ottimo l''avviso quando i precedenti non sono nel testo. Mi ha salvato due volte dall''incollare massime confabulate.',
  'Avv. Paola Esposito',
  false,
  '2026-05-12T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'riassunto-cassazione-5-punti'),
  2,
  'Su sentenze brevi tende a gonfiare. Per un decreto di rigetto di 4 pagine i ''5 punti'' sono ridondanti. Andrebbe parametrizzata.',
  'Avvocato',
  true,
  '2026-05-04T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'riassunto-cassazione-5-punti'),
  5,
  'Pulita, prevedibile, copiabile. Esattamente quello che serve in studio.',
  'Avv. Luca Rocca',
  false,
  '2026-04-30T12:00:00Z'
);

insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'tfr-contributi-inps'),
  4,
  'Buona. Il check ''dato incongruo'' ha pescato due RAL sotto minimale che avevo trascritto male. La rivalutazione [VERIFICA] è onesta.',
  'Avv. Elena Castiglia',
  false,
  '2026-05-20T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'tfr-contributi-inps'),
  2,
  'Le aliquote contributive che propone sono di due anni fa per il mio CCNL. Il [VERIFICA] c''è ma non basta — un avvocato giuslavorista esperto se ne accorge, un giovane no.',
  'Avvocato',
  true,
  '2026-05-12T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'tfr-contributi-inps'),
  4,
  'Utile per il calcolo lordo. Per la quantificazione netta finale uso comunque il commercialista.',
  'Avv. Riccardo Sambin',
  false,
  '2026-04-25T12:00:00Z'
);

insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'ricorso-tar-vizi'),
  5,
  'La mappatura per figure sintomatiche dell''eccesso di potere è didattica e pratica al tempo stesso. La uso anche con i tirocinanti.',
  'Avv. Alessandra Pomelli',
  false,
  '2026-05-21T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'ricorso-tar-vizi'),
  4,
  'Solida sull''impianto. Sui ricorsi in materia urbanistica andrebbe specializzata — il vizio motivazionale lì ha sue specificità.',
  'Avv. Giorgio Tartaglia',
  false,
  '2026-05-09T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'ricorso-tar-vizi'),
  3,
  'Funziona bene su atti puntuali. Su atti complessi tipo bandi di gara è troppo generica.',
  'Avvocato',
  true,
  '2026-05-02T12:00:00Z'
);

insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'clausola-arbitrale-icc'),
  5,
  'Sul corporate cross-border è uno strumento incredibile. Il check separabilità + lingua + sede mi ha evitato due clausole patologiche in chiusura.',
  'Avv. Beatrice Mancuso',
  false,
  '2026-05-24T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'clausola-arbitrale-icc'),
  5,
  'Suggested wording in inglese pulito, no Latin tags inutili. Esattamente come la userei in studio.',
  'Avv. Francesco Lipari',
  false,
  '2026-05-15T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'clausola-arbitrale-icc'),
  3,
  'Buona su ICC. Sui regolamenti di altre istituzioni (LCIA, HKIAC, SIAC) inevitabilmente non aiuta. Vorrei una skill gemella su quelle.',
  'Avvocato',
  true,
  '2026-05-07T12:00:00Z'
);

insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'dpa-art28-gdpr'),
  5,
  'L''ho usata su 14 DPA in due settimane. Il flag su ''subprocessor general approval senza lista'' ha sempre pescato — è il tipico cavallo di Troia dei vendor SaaS USA.',
  'Avv. Cristina Pellizzari',
  false,
  '2026-05-23T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'dpa-art28-gdpr'),
  4,
  'Molto utile. La check sul Liability cap del processor è una sezione che si dimentica sempre nelle review veloci.',
  'Avv. Davide Spagnoletti',
  false,
  '2026-05-11T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'dpa-art28-gdpr'),
  4,
  'Trovata la sezione [ALERT] su trasferimenti extra-UE senza SCC ben costruita. Su SCC 2021 vs nuove TIA però non distingue, e dovrebbe.',
  'Avvocato',
  true,
  '2026-05-01T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'dpa-art28-gdpr'),
  5,
  'Ottimo per il primo screening. Una review approfondita richiede comunque expertise umana ma la skill fa il 70% del lavoro.',
  'Avv. Martina Ferrer',
  false,
  '2026-04-22T12:00:00Z'
);

insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'antiriciclaggio-cliente-nuovo'),
  4,
  'Le domande sequenziali (una alla volta, non tutte insieme) sono il punto forte. È esattamente come faccio io con un cliente in studio.',
  'Avvocato',
  true,
  '2026-05-19T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'antiriciclaggio-cliente-nuovo'),
  4,
  'Il framing ''forniamo elementi, l''avvocato decide la SOS'' è corretto. Su questo la skill è onesta — altre ne ho viste che ''concludono''.',
  'Avv. Carlo Tessari',
  false,
  '2026-05-08T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'antiriciclaggio-cliente-nuovo'),
  3,
  'Da aggiornare con il Reg. UE 2024/1624. Cita il fatto che è in vigore graduale ma non specifica quali parti già applicabili.',
  'Avv. Ilaria Volpi',
  false,
  '2026-04-27T12:00:00Z'
);

insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'plusvalenza-immobiliare-67-tuir'),
  5,
  'Il confronto IRPEF vs imposta sostitutiva 26% con il risparmio stimato è molto utile in fase di trattativa col cliente. Trasparente.',
  'Avv. Salvatore Mancuso',
  false,
  '2026-05-22T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'plusvalenza-immobiliare-67-tuir'),
  4,
  'Check delle esenzioni completo. La condizione ''prima casa adibita > 50% del periodo'' la dimentico sempre, qui la fa lei.',
  'Avv. Roberta Quartana',
  false,
  '2026-05-13T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'plusvalenza-immobiliare-67-tuir'),
  3,
  'Va incrociata col commercialista. Da sola non basta per dare advice fiscale al cliente — ma la skill stessa lo dice, quindi è onesta.',
  'Avvocato',
  true,
  '2026-04-30T12:00:00Z'
);

insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'nda-bilingue-it-en'),
  5,
  'L''ho scritta io ed è la mia favorita 😄 Sul one-way + mutual la struttura a colonne IT-EN è chiarissima per le controparti USA/UK.',
  'Avv. Elena Russo',
  false,
  '2026-05-26T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'nda-bilingue-it-en'),
  5,
  'Il fatto che NON inserisca clausole non richieste (non-solicit, non-compete) è una virtù enorme. Altri tool li ficcano dentro ''di default'' creando casini.',
  'Avv. Stefania Trentini',
  false,
  '2026-05-17T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'nda-bilingue-it-en'),
  4,
  'Wording inglese di buon livello. Per chi negozia con tedeschi vorrei una variante DE-EN; per ora la uso come scaffold e adatto.',
  'Avv. Pietro Lombardi',
  false,
  '2026-05-04T12:00:00Z'
);

insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'eccezioni-opp-ingiuntivo'),
  5,
  'La mappa per prescrizione (ordinaria 10 / speciali 5/3/1) è precisa e il [VERIFICA] sulle prescrizioni speciali è ben piazzato.',
  'Avv. Riccardo Manai',
  false,
  '2026-05-25T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'eccezioni-opp-ingiuntivo'),
  4,
  'Su vizi del decreto è completa. Sulla sospensione 649 c.p.c. potrebbe approfondire la giurisprudenza recente su ''gravi motivi'' — ma il [VERIFICA] c''è.',
  'Avvocato',
  true,
  '2026-05-14T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'eccezioni-opp-ingiuntivo'),
  5,
  'L''ho usata per impostare 5 opposizioni in un mese. È il mio scaffold standard ora.',
  'Avv. Anna Carraro',
  false,
  '2026-05-06T12:00:00Z'
);
insert into reviews (skill_id, stars, text, author_name, anonymous, created_at) values (
  (select id from skills where slug = 'eccezioni-opp-ingiuntivo'),
  2,
  'Manca la sezione sull''opposizione tardiva ex art. 650 c.p.c. — non grave perché casi rari, ma per essere completa andrebbe aggiunta.',
  'Avvocato',
  true,
  '2026-04-28T12:00:00Z'
);

-- ============================================================
-- ERRORI (8)
-- ============================================================
insert into errors (slug, title, ai_tool, area, author_name, anonymous, description, prompt, wrong_answer, correction, references_text, reported_count, created_at) values (
  'claude-cassazione-inesistente',
  'Claude inventa Cass. n. 18432/2024 inesistente',
  'Claude',
  'civile',
  'Avv. Federico Bertini',
  false,
  'Chiedendo precedenti sulla responsabilità solidale ex art. 2055 c.c., Claude ha citato una Cass. n. 18432/2024 con massima plausibile ma la sentenza NON esiste sui banche dati ufficiali.',
  'Cerca precedenti recenti della Cassazione civile sulla responsabilità solidale ex art. 2055 c.c. in caso di concorso di colpa di più professionisti (es. avvocato + commercialista). Dammi la massima esatta e il numero.',
  'Recentemente la Cassazione si è pronunciata con sentenza n. 18432 del 14 marzo 2024, sez. III civile, che ha statuito: "Nel caso di concorso di colpa tra più professionisti, la responsabilità solidale ex art. 2055 c.c. opera anche quando le condotte siano causalmente autonome ma convergenti nel produrre il danno...". (sentenza Cass. 18432/2024)',
  'La sentenza Cass. n. 18432/2024 NON esiste. Verificato su DeJure, Cassazione Italgiure, Foro Italiano. La massima citata è plausibile ma fabbricata. Il principio sostanziale citato è in realtà espresso in Cass. SU n. 581/2008 (vera), ma il riferimento puntuale è inventato. INSEGNAMENTO: chiedere SEMPRE a Claude di citare solo precedenti che hai tu fornito; non farti dare numeri di sentenza inventati.',
  'Cass. SU n. 581/2008 (vera, citarla così); Art. 2055 c.c.',
  23,
  '2026-05-28T12:00:00Z'
);

insert into errors (slug, title, ai_tool, area, author_name, anonymous, description, prompt, wrong_answer, correction, references_text, reported_count, created_at) values (
  'chatgpt-aliquota-irpef-2024',
  'ChatGPT-4 sbaglia scaglione IRPEF 2024',
  'ChatGPT',
  'tributario',
  'Avvocato',
  true,
  'Chiedendo l''aliquota IRPEF 2024 per redditi tra 28k e 50k, ChatGPT applica lo scaglione 27% (pre-riforma 2024) invece del nuovo 35% unificato 28k-50k.',
  'Quale aliquota IRPEF si applica nel 2024 a un reddito imponibile di 42.000 euro?',
  'Nel 2024 il reddito di 42.000 euro rientra nello scaglione 27% applicato ai redditi tra 15.001 e 50.000 euro. L''IRPEF si calcola: primi 15.000 al 23% + eccedenza fino a 28.000 al 25% + eccedenza fino a 42.000 al 27%.',
  'Errore: ChatGPT applica scaglioni 2023, non 2024. La Legge 30 dicembre 2023 n. 213 (Legge di bilancio 2024) ha riformato gli scaglioni: 23% fino a 28.000, 35% da 28.001 a 50.000, 43% oltre 50.000. Per 42.000 euro: (28.000 × 23%) + (14.000 × 35%) = 6.440 + 4.900 = 11.340 IRPEF lorda. Differenza vs calcolo ChatGPT: ~600 euro. INSEGNAMENTO: per parametri fiscali che cambiano anno per anno, verificare SEMPRE l''anno di knowledge cutoff del modello e incrociare con Agenzia Entrate.',
  'Legge 213/2023 art. 1 c. 1; D.L. 216/2023 (decreto attuativo riforma IRPEF) [VERIFICA aggiornamenti successivi]',
  18,
  '2026-05-24T12:00:00Z'
);

insert into errors (slug, title, ai_tool, area, author_name, anonymous, description, prompt, wrong_answer, correction, references_text, reported_count, created_at) values (
  'copilot-concussione-corruzione',
  'Copilot confonde concussione e corruzione propria',
  'Copilot',
  'penale',
  'Avv. Paolo Marchesi',
  false,
  'Chiedendo l''esatta qualificazione di una condotta del pubblico ufficiale che ''induce'' (non costringe) il privato a dare denaro, Copilot risponde ''concussione'' ex art. 317 c.p., dimenticando la riforma 2012 che ha spostato l''induzione indebita all''art. 319-quater.',
  'Il pubblico ufficiale che induce il privato a dargli denaro promettendo in cambio un atto del suo ufficio: che reato è? Cita l''articolo del codice penale.',
  'Si tratta di concussione, reato previsto dall''art. 317 c.p. La concussione si configura quando il pubblico ufficiale, abusando della propria qualità o dei propri poteri, costringe o induce taluno a dare o promettere indebitamente, a lui o a un terzo, denaro o altra utilità.',
  'Errore: dal 2012 (L. 190/2012, c.d. ''legge Severino'') l''art. 317 c.p. NON comprende più l''induzione, ma solo la costrizione. L''induzione indebita a dare o promettere utilità è stata trasferita al NUOVO art. 319-quater c.p., con pene diverse (3-8 anni vs 6-12 della concussione costrittiva) e con punibilità anche del privato indotto (cosa che nella concussione non era prevista). Distinzione importantissima per la difesa. INSEGNAMENTO: Copilot tende a usare formulazioni pre-riforma; per reati codicistici modificati post-2010, verificare sempre data norma.',
  'Art. 317 c.p. (post L. 190/2012); art. 319-quater c.p. (introdotto da L. 190/2012); Cass. SU n. 12228/2014 (''Maldera'') sulla distinzione costrizione/induzione',
  14,
  '2026-05-19T12:00:00Z'
);

insert into errors (slug, title, ai_tool, area, author_name, anonymous, description, prompt, wrong_answer, correction, references_text, reported_count, created_at) values (
  'gemini-articolo-cds-inesistente',
  'Gemini cita art. 142-bis del Codice della Strada (inesistente)',
  'Gemini',
  'amministrativo',
  'Avvocato',
  true,
  'Chiedendo la disciplina degli autovelox fissi, Gemini cita un inesistente ''art. 142-bis del Codice della Strada'' con disposizioni plausibili.',
  'Quali sono i requisiti normativi per l''installazione di autovelox fissi su strada urbana di scorrimento? Cita gli articoli del Codice della Strada.',
  'L''art. 142-bis del Codice della Strada, introdotto dal D.L. 121/2002, prevede che gli autovelox fissi su strade urbane di scorrimento debbano essere segnalati con cartelli specifici posti almeno 250 metri prima del dispositivo. Il decreto attuativo dell''art. 142-bis specifica anche le caratteristiche cromatiche dei segnali.',
  'L''art. 142-bis del Codice della Strada (D.Lgs. 285/1992) NON esiste. La disciplina degli autovelox è all''art. 142 (limiti di velocità) + art. 201 c. 1-bis (presupposti contestazione differita) + Decreto Ministeriale 282/2017 (tecnico). Il segnalamento è previsto dal D.M. 282/2017 e dalla Direttiva del Ministero dell''Interno 300/A/9554/14/144/5/20/3 del 14/8/2009. Distanza minima segnale-postazione: 250 metri su strade urbane di scorrimento, 1 km su autostrade. INSEGNAMENTO: Gemini inventa numerazioni ''bis'' con confidenza. Verificare SEMPRE su Normattiva.it.',
  'D.Lgs. 285/1992 (CdS) art. 142, 201; D.M. 282/2017; Direttiva Min. Int. 14/8/2009',
  11,
  '2026-05-15T12:00:00Z'
);

insert into errors (slug, title, ai_tool, area, author_name, anonymous, description, prompt, wrong_answer, correction, references_text, reported_count, created_at) values (
  'claude-art-645-cpc',
  'Claude sbaglia decorrenza termine opposizione ingiuntivo',
  'Claude',
  'contenzioso',
  'Avv. Tommaso Greco',
  false,
  'Chiedendo se il termine di opposizione a decreto ingiuntivo decorra dalla notifica o dalla conoscenza, Claude risponde ''dalla conoscenza effettiva'', errato.',
  'Da quando decorre il termine di 40 giorni per opporsi a un decreto ingiuntivo notificato a una società?',
  'Il termine di 40 giorni per opporsi al decreto ingiuntivo ex art. 645 c.p.c. decorre dalla conoscenza effettiva del decreto da parte del legale rappresentante della società. Pertanto, se la notifica è avvenuta presso la sede ma il legale rappresentante non ne è venuto a conoscenza tempestivamente, il termine può decorrere da quel momento successivo.',
  'Errore. Il termine decorre dalla NOTIFICA, non dalla conoscenza effettiva (art. 641 c.p.c. + art. 645 c.p.c.). Per le società, la notifica al rappresentante o presso la sede legale fa decorrere il termine indipendentemente dalla conoscenza effettiva. L''unico rimedio per ''mancata conoscenza'' è l''opposizione tardiva ex art. 650 c.p.c., subordinata a prova di irregolarità della notifica, caso fortuito o forza maggiore. INSEGNAMENTO: su termini decadenziali processuali, Claude a volte confonde ''decorrenza'' con ''consapevolezza''. Verificare SEMPRE il dato normativo testuale.',
  'Art. 641, 645, 650 c.p.c.; Cass. SU n. 9938/2005 sulla decorrenza dalla notifica',
  9,
  '2026-05-11T12:00:00Z'
);

insert into errors (slug, title, ai_tool, area, author_name, anonymous, description, prompt, wrong_answer, correction, references_text, reported_count, created_at) values (
  'codex-dpa-art28-g',
  'Codex genera check DPA dimenticando art. 28(3)(g) GDPR',
  'Codex',
  'privacy',
  'Avv. Marco Ferrari',
  false,
  'Chiedendo a Codex di scrivere uno script che verifichi i requisiti dell''art. 28(3) GDPR in un DPA, il codice omette il check sulla lettera (g) — assistenza al titolare per esercizio diritti interessati.',
  'Scrivimi una funzione Python che verifichi se un Data Processing Agreement contenga tutte le clausole obbligatorie ex art. 28(3) GDPR. Usa una lista di pattern regex per ciascun requisito.',
  '```python
REQUIREMENTS = [
    (''subject_matter'', r''subject.{0,20}matter|oggetto.{0,20}trattamento''),
    (''duration'', r''duration|durata''),
    (''nature'', r''nature.{0,20}purpose|natura.{0,20}finalit''),
    (''confidentiality'', r''confidential|riservat''),
    (''security'', r''security.{0,20}measures|misure.{0,20}sicurezza''),
    (''subprocessors'', r''subprocessor|sub.{0,3}processor''),
    (''breach'', r''breach.{0,20}notification|notifica.{0,20}violazion''),
    (''return_deletion'', r''return.{0,10}deletion|restituz|cancellaz''),
    (''audit'', r''audit|ispezion''),
]
```',
  'Manca il check per art. 28(3)(g): "assistenza al titolare per il riscontro alle richieste degli interessati nell''esercizio dei diritti di cui al Capo III". Questo è uno dei requisiti più dimenticati DAI DPA reali, e Codex coerentemente lo omette dalla lista. Da aggiungere: `(''data_subject_rights'', r''data.{0,5}subject.{0,5}rights|diritti.{0,5}interessat|capo.{0,5}III'')`. INSEGNAMENTO: quando Codex genera elenchi di requisiti normativi, controllare incrociando col testo della norma — gli elenchi puliti sono i più sospetti di omissioni.',
  'Reg. UE 2016/679 art. 28(3) lett. (a)-(j); Capo III GDPR (artt. 12-23)',
  8,
  '2026-05-07T12:00:00Z'
);

insert into errors (slug, title, ai_tool, area, author_name, anonymous, description, prompt, wrong_answer, correction, references_text, reported_count, created_at) values (
  'chatgpt-ritenuta-acconto',
  'ChatGPT confonde aliquota ritenuta acconto su parcella',
  'ChatGPT',
  'lavoro',
  'Avvocato',
  true,
  'Chiedendo l''aliquota di ritenuta d''acconto su parcella di avvocato emessa a società italiana, ChatGPT risponde 23% (aliquota su redditi da lavoro autonomo per persone fisiche), confondendo regimi.',
  'Quale aliquota di ritenuta d''acconto applica la mia controparte (S.r.l. italiana) sulla fattura che le emetto come avvocato (P.IVA italiana, regime ordinario)?',
  'L''aliquota di ritenuta d''acconto applicata sulla parcella dell''avvocato è del 23%, corrispondente all''aliquota IRPEF del primo scaglione. Pertanto, se emetti fattura per 1.000 euro + IVA, la S.r.l. tratterrà 230 euro di ritenuta che ti sarà accreditata come acconto IRPEF.',
  'Errore di FRAMING. La ritenuta d''acconto sui redditi da lavoro autonomo NON è l''aliquota IRPEF, è l''aliquota fissa del 20% prevista dall''art. 25 DPR 600/1973. Anche se il primo scaglione IRPEF è al 23%, la ritenuta d''acconto su prestazioni professionali è sempre 20%. (Per professionisti residenti, ovvio; per non residenti regime diverso). INSEGNAMENTO: ChatGPT confonde ritenute d''acconto con scaglioni IRPEF — sono cose diverse. La ritenuta è ''acconto'' di un''imposta che si liquida poi a fine anno; il 20% è un parametro fisso ex lege, non uno scaglione.',
  'Art. 25 DPR 600/1973; Art. 53 TUIR (redditi da lavoro autonomo)',
  7,
  '2026-05-04T12:00:00Z'
);

insert into errors (slug, title, ai_tool, area, author_name, anonymous, description, prompt, wrong_answer, correction, references_text, reported_count, created_at) values (
  'claude-precedente-cgue-trust',
  'Claude inventa precedente CGUE su trust estero',
  'Claude',
  'commerciale',
  'Avv. Beatrice Mancuso',
  false,
  'Chiedendo precedenti CGUE su trasparenza dei trust esteri ai fini tassazione, Claude cita ''CGUE C-432/22 Trustees v. Commissione'' che non esiste.',
  'Esistono precedenti della Corte di Giustizia UE in materia di obbligo di trasparenza dei trust esteri (settlor non UE) ai fini fiscali per i beneficiari residenti UE?',
  'Sì, il precedente di riferimento è CGUE 14 ottobre 2023, causa C-432/22 ''Trustees of European Charitable Trust v. Commissione'', che ha stabilito che gli Stati membri possono richiedere la disclosure del settlor e dei beneficiari anche per trust istituiti in giurisdizioni non UE, purché la richiesta sia proporzionata e non discriminatoria. Il principio è coerente con la Direttiva DAC6.',
  'Il riferimento CGUE C-432/22 NON esiste nei repository ufficiali (curia.europa.eu, EUR-Lex). Il principio sostanziale citato è plausibile e si avvicina a quello espresso in alcuni casi reali (es. C-694/20 Orde van Vlaamse Balies, su segreto professionale + DAC6), ma il nome della causa è fabbricato. INSEGNAMENTO: per precedenti CGUE, l''unica fonte affidabile è curia.europa.eu. Claude inventa con grande fluency in materia europea.',
  'C-694/20 (vero, su DAC6 e segreto avvocato); Dir. UE 2018/822 (DAC6); curia.europa.eu (verifica)',
  6,
  '2026-04-29T12:00:00Z'
);

-- ============================================================
-- Aggiunge anche qualche helpful_vote casuale per coerenza con i count del mock
-- (skip: helpful_votes verranno popolati man mano dagli utenti reali)
-- ============================================================

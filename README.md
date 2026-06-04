# SkillAdvisor — prototipo

Prototipo di piattaforma dove **giuristi italiani** possono condividere skill (istruzioni pronte per Claude, ChatGPT e altri LLM su task ricorrenti) e segnalare errori dell'AI nei contesti legali italiani.

Costruito come ospite del gruppo **Giuristi AI** per provare un'idea. Niente è ancora deciso: il nome, l'aspetto, le categorie, la moderazione, il dominio finale — **tutto è da discutere insieme**. Se l'idea regge, decidiamo insieme se continuarla e in che forma — incluso se affidare a qualcuno, e a chi, organizzazione GitHub e dominio.

## Cosa fa il prototipo

Due viste:

- **Skill** — schede con titolo, autore, area legale, descrizione. Layer recensioni stile TripAdvisor (stelle + testo + nome avvocato, **anonimato opt-in se c'è ragione**). Ordinamento per più recensite / meglio valutate / più recenti.
- **Errori dell'AI** — casi reali (anonimizzati) in cui un LLM ha sbagliato: prompt, risposta errata, correzione con riferimenti normativi. Browsing per area legale e per AI (Claude, ChatGPT, Copilot, Gemini, Codex, ...). Banner prominente sull'anonimizzazione preliminare.

Il prototipo è un singolo file HTML statico con dati mock (10 skill + 8 errori inventati ma plausibili) — niente backend, niente login, niente database. È per **valutare l'idea e l'UX**, non per essere usato sul serio.

## Come provarlo

Apri [`index.html`](index.html) nel browser. O visita la GitHub Pages del repo (se attivata).

## Discussione

Critiche, modifiche, richiesta di cambiare nome o di scartare l'idea: scrivetemi nel gruppo WhatsApp Giuristi AI, oppure aprite una issue qui se preferite.

## Licenze

- **Codice** (HTML, CSS, JavaScript): [AGPL-3.0](LICENSE)
- **Contenuti** (skill, recensioni, segnalazioni errori contribuiti da utenti): se diventa prodotto reale, CC-BY-SA 4.0 sui contenuti user-generated è la direzione proposta. Per ora il prototipo contiene solo contenuti mock inventati.

## Origine

Prototipo costruito da Michele Loi come ospite del gruppo Giuristi AI, giugno 2026. Trasferibile a chi gestisce il gruppo se l'idea viene accettata.

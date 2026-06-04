# Istruzioni — SkillAdvisor (prototipo)

> Questa è una guida per chi visita il prototipo. Spiega cosa puoi fare, come pubblicare una skill o un prompt e segnalare un errore, e cosa **non** aspettarti.

> **Per chi modifica questo file:** `istruzioni.md` è la **fonte autoritativa**; la tab "Istruzioni" sul sito (`index.html` → `<section id="viewIstruzioni">`) è un HTML fragment **derivato manualmente** da questo MD. **Niente automatismo**: dopo aver modificato `istruzioni.md`, chiedi a un sub-agent (o rifai a mano) la rigenerazione del fragment HTML nella section `viewIstruzioni` di `index.html`, poi commit + push entrambi i file insieme. Decisione SID-20260604-152531.

---

## Cos'è questo sito

Un posto dove giuristi italiani **condividono fra loro** istruzioni pronte per gli LLM (Claude, ChatGPT, Copilot, Gemini…) su task legali ricorrenti, e dove **segnalano errori** dell'AI in contesti giuridici italiani.

Due tab in alto:

- **Skill e prompt** — istruzioni pronte che funzionano per un certo task (es. *"Bozza ricorso TAR"*, *"Check DPA art. 28 GDPR"*, *"Riassunto sentenza Cassazione in 5 punti"*). Possono essere SKILL.md formali (frontmatter + body), prompt grezzi salvati in un file di testo, frammenti di CLAUDE.md, orchestrazioni MCP. La community usa questi termini in modo intercambiabile — il sito li tratta tutti come "istruzioni che dai all'AI". Le altre persone le copiano e le usano col loro AI.
- **Errori dell'AI** — casi reali in cui un LLM ha sbagliato in modo educativo per i colleghi: prompt che hai dato, risposta errata dell'AI, cosa era corretto.

---

## Cosa **non** è

- **Non è consulenza legale.** Le skill e i prompt sono strumenti che l'avvocato decide di usare a propria responsabilità. La piattaforma non si fa carico dell'esito.
- **Non sostituisce verifica delle fonti.** Le istruzioni stesse possono marcare `[VERIFICA]` i punti delicati. L'avvocato controlla i riferimenti normativi prima di usarli in atto.
- **Non è un marketplace commerciale.** Non si paga per pubblicare, non si paga per leggere, non si compra niente. I contributi sono della comunità a beneficio della comunità.
- **Non è un posto per recensire tool o servizi commerciali interi.** Quello che si pubblica nella tab *Skill e prompt* sono **istruzioni testuali** che dai a un'AI: prompt grezzi, SKILL.md, frammenti di CLAUDE.md, orchestrazioni MCP. Lexroom, BuddaLaw, One Legale, Top24, libra, 4c.ai, Manus, Calpurnio e simili sono **programmi interi**, non skill — non vanno qui. Se hai osservato un loro errore fattuale su un caso concreto, c'è la tab *Errori dell'AI* (vedi sotto, con la regola "descrivi cosa è successo, non valutare il prodotto").
- **Non c'è moderazione preventiva.** Quello che pubblichi va live subito, senza che nessuno controlli prima. La qualità la giudica la community con stelle, recensioni e segnalazioni.

---

## Come navigare

### Tab Skill e prompt

- Ogni scheda mostra: titolo, autore, area legale (pill verde), eventuale badge "Tipo di artefatto" (se chi ha pubblicato l'ha categorizzato — vedi sotto), descrizione breve, stelle medie + conteggio recensioni
- Filtri in toolbar: ricerca testuale (titolo, autore, argomento) + filtri per area + filtro "Tipo:" (visibile solo se almeno un contributo è stato taggato)
- Ordinamento: *Più recensite* (default) / *Meglio valutate* / *Più recenti*
- Click **"Apri"** su una scheda per leggere il contenuto completo, le recensioni, copiare le istruzioni

### Tab Errori dell'AI

- Banner giallo in cima ti ricorda di **anonimizzare il caso prima di condividere** un errore (link a [Recode IT](https://recode.micheleloi.pro) per pseudonimizzare)
- Ogni scheda mostra: titolo, AI tool (badge blu, es. Claude / ChatGPT / Gemini), area legale, descrizione, segnalazioni
- Filtri: ricerca testuale + filtri per area + filtri per AI
- Click **"Apri"** per vedere: contesto, prompt che hai dato all'AI, risposta errata, cosa era corretto (con riferimenti)

---

## Come pubblicare una skill o un prompt

**Prerequisiti**: devi essere un avvocato (o praticante / docente / magistrato / notaio) del gruppo Giuristi AI. Niente login, niente account — si parte dal fatto che tu sei già nel cerchio.

### Passo 1 — Click "Condividi le tue istruzioni"

In alto a destra, bottone azzurro.

### Passo 2 — Compila i campi del modale

| Campo | Cosa scrivere |
|---|---|
| **Il tuo nome** | Es. *Avv. Maria Rossi*. Va pubblicato (vedi anonimato sotto). |
| **Email** *(opzionale)* | Se la metti, riceverai un **link permanente per modificare o cancellare il contributo** via email. Se non la metti, il contributo è append-only e non può essere modificato. NB: l'email **non viene mostrata pubblicamente**. |
| **Titolo** | Una riga descrittiva. Es. *"Bozza ricorso TAR — vizi atto"*. |
| **Area legale** | Scegli dal menu: civile / penale / lavoro / amministrativo / commerciale / privacy / societario / tributario / contenzioso / ip / generale. |
| **Cosa fanno queste istruzioni** | 2-3 righe per un collega: cosa ottiene chi le usa. |
| **Le istruzioni che dai all'AI** | Il testo vero e proprio da dare all'AI. Puoi usare un prompt grezzo, formato Markdown, frontmatter SKILL.md (`name / description / when_to_use` + body), frammento di CLAUDE.md, o altro. Vedi esempi sotto. |
| **GitHub** *(opzionale)* | Link al repo se la skill vive su GitHub. Altrimenti lascia vuoto. |
| **Riferimenti normativi** *(opzionale)* | Articoli, leggi, sentenze da consultare. |
| **Tipo di artefatto** *(opzionale)* | Aiuta i colleghi a capire cos'è quello che stai condividendo. Cinque valori — vedi sezione "Tipo di artefatto" sotto. Se non sai quale scegliere, lascia "non specifico" — va benissimo. |

### Passo 3 — Click "Pubblica"

Il contributo va live subito. Reload pagina e lo vedi in cima alla griglia. Se hai messo l'email, ricevi una mail con il link "Modifica/cancella" (validità: 365 giorni).

### Anonimato

Per la pubblicazione di una skill o di un prompt non c'è opzione anonima — il contributo resta autoriale per dare credito a chi l'ha costruito. Se non vuoi metterci il tuo nome, **non pubblicarlo**.

Le **recensioni** e le **segnalazioni di errori**, invece, possono essere anonime opt-in (vedi sotto).

---

## Come scrivere una recensione

Una recensione è un'opinione su una skill o un prompt che hai usato. Aiuta i colleghi a capire se funziona davvero, in che casi, con quali limiti.

### Passo 1 — Apri la scheda del contributo

Tab "Skill e prompt" → click "Apri" sulla scheda che vuoi recensire.

### Passo 2 — Scorri in fondo, click "Scrivi una recensione"

Bottone verde nella sezione "Recensioni".

### Passo 3 — Compila

| Campo | Cosa scrivere |
|---|---|
| **Valutazione** | Da 1 a 5 stelle. Clicca le stelle. |
| **La tua recensione** | Come l'hai usata? Su che caso? Cosa ha funzionato, cosa no? |
| **Il tuo nome** | Es. *Avv. Mario Bianchi*. |
| **Email** *(opzionale)* | Se la metti, ricevi link "Modifica/cancella" della recensione (utile se cambi idea o ti accorgi di un errore). Non viene pubblicata. |
| **Pubblica anonima** | Casella spuntabile. Se vuoi pubblicare anonima (vedi sotto). |

### Anonimato opt-in

Le recensioni firmate hanno più peso (lettori vedono chi le scrive). Però se hai una **ragione concreta** per non firmare (es. recensione critica su una skill o un prompt di un partner di studio, o caso commercialmente delicato), puoi spuntare *"Pubblica anonima"*. Il tuo nome non apparirà pubblicamente. Apparirà come *"Avvocato (anonimo)"*.

### Passo 4 — Click "Pubblica"

Toast di conferma. Reload pagina → vedi la tua recensione nella scheda.

---

## Come segnalare un errore dell'AI

Le segnalazioni servono per **avvisare i colleghi** di trappole note dell'AI in contesti legali italiani. Esempio classico: l'AI cita una sentenza Cassazione che non esiste, ma con confidenza alta.

### Regola del framing: fatto + contesto + prova, non valutazione del prodotto

Qui si registrano **errori fattuali osservati**, non opinioni sul tool. Sono ammessi i nomi dei prodotti (Claude, ChatGPT, Lexroom, BuddaLaw, One Legale, ecc.) *se* servono a inquadrare l'errore. Esempi:

- ✅ Va bene: *"Lexroom su NIS2 ha lasciato fuori 3 determinazioni ACN — verificato sul sito ACN, decisioni n. X, Y, Z del 2025"*
- ✅ Va bene: *"Claude ha citato Cass. n. 12345/2025 — sentenza inesistente, verificato su CED"*
- ❌ Non va bene: *"Lexroom è scadente"* / *"non lo userei mai"*
- ❌ Non va bene: *"BuddaLaw è meglio di Lexroom"* (è un giudizio comparativo di prodotto, non un errore osservato)

Se quello che vuoi condividere è una recensione di un tool intero (cosa fa bene, cosa fa male nel complesso, vale i suoi soldi), questo non è il posto giusto: il sito non ospita recensioni di prodotti commerciali.

### ⚠️ Prima — Anonimizza il caso

Se l'errore riguarda un caso reale del tuo studio, prima di condividere il prompt e la risposta dell'AI devi **togliere tutti i dati identificativi**: nome del cliente, controparti, numeri di fascicolo, dati personali, sede.

Usa **Recode IT** ([recode.micheleloi.pro](https://recode.micheleloi.pro)) per pseudonimizzare automaticamente. È un strumento che gira tutto nel tuo browser: niente viene mandato a server esterni, e tu puoi de-pseudonimizzare quando vuoi nei tuoi documenti.

### Passo 1 — Click "Segnala un errore"

Sulla tab "Errori dell'AI", bottone azzurro in alto a destra.

### Passo 2 — Compila

| Campo | Cosa scrivere |
|---|---|
| **AI che ha sbagliato** | Menu: Claude / ChatGPT / Copilot / Gemini / Codex / Mistral / Altra |
| **Area legale** | Menu: come per le skill |
| **Titolo dell'errore** | Una riga descrittiva. Es. *"Claude inventa Cass. n. 12345/2025 inesistente"* |
| **Descrizione breve** | 2-3 righe: contesto del caso (anonimizzato!), cosa cercavi, cosa ti aspettavi |
| **Prompt che hai dato** | Il prompt che hai posto all'AI. ANONIMIZZATO. |
| **Risposta errata dell'AI** | La risposta sbagliata. ANONIMIZZATA. |
| **Cosa era corretto** | Spiega cosa l'AI ha sbagliato + qual è la risposta giusta + cita norme, sentenze, articoli. |
| **Il tuo nome** | Es. *Avv. Tizio* |
| **Email** *(opzionale)* | Per ricevere link "Modifica/cancella" della segnalazione. Non pubblicata. |
| **Pubblica anonima** | Spunta se il caso è ancora riconducibile a un cliente nonostante l'anonimizzazione, o per altra ragione concreta. |

### Passo 3 — Click "Pubblica"

Toast di conferma. La segnalazione va live subito.

---

## Modificare o cancellare un tuo contributo

Se hai pubblicato una recensione o un errore con la tua email, hai ricevuto un'email con un link tipo:

`https://micheleloi.github.io/skill-sharing-giuristi-x/edit.html?token=ABC123…`

**Conservalo** — è la tua credenziale. Senza, non puoi modificare. Il link non scade per 365 giorni.

### Come usarlo

1. Click sul link nell'email
2. Si apre una pagina con un form pre-compilato con i tuoi dati pubblicati
3. **Per modificare**: cambia i campi che vuoi → click "Salva modifiche"
4. **Per cancellare**: click "Cancella definitivamente" → conferma → il contributo sparisce

### E per le skill / prompt pubblicati?

Le **skill e i prompt** non si modificano dopo la pubblicazione (sono append-only, come libri pubblicati). Se hai sbagliato qualcosa e vuoi correggere, hai due strade:

- **Pubblica una v2** con titolo *"… v2"* e nelle prime righe scrivi *"supersedes versione precedente"*
- **Richiedi rimozione** della prima usando il modulo in fondo alla pagina (vedi sotto)

---

## Richiedere rimozione di un contenuto

Se hai pubblicato qualcosa che vuoi rimuovere (skill, prompt, recensione, errore) ma non hai più accesso all'email per modificare, o se vuoi segnalare un contenuto altrui (es. dati personali non anonimizzati per errore), c'è il modulo **"Hai bisogno di rimuovere un contenuto?"** in fondo alla pagina.

1. Click sul link nel footer
2. Compila: descrivi cosa rimuovere + perché + lascia tua email
3. Click "Invia richiesta"
4. Si apre il tuo client di posta con il messaggio già scritto, indirizzato al maintainer del prototipo
5. Conferma l'invio dal tuo client mail

Il maintainer valuta e rimuove di solito entro 2-5 giorni.

---

## Come funziona "Utile (n)"

Sotto ogni recensione c'è un bottone *"Utile (n)"*. Cliccalo se la recensione ti è servita a decidere se usare quella skill o quel prompt. Aumenta il conteggio di 1.

Non puoi votare la stessa recensione due volte (il sito ricorda quali hai già votato sul tuo browser).

---

## Esempio: l'avvocato che ha un suo prompt e vuole condividerlo

Tu hai un prompt che hai sviluppato col tempo — istruzioni che dai a Claude (o ChatGPT, o Gemini) per fare un certo lavoro ricorrente in studio. Lo hai magari in un file di Word, in un blocco note, o copiato dalle tue ultime conversazioni con l'AI. **Funziona**, sai esattamente come usarlo.

Non sai cos'è GitHub, non vuoi imparare YAML, non vuoi un repo. Vuoi solo condividerlo coi colleghi del gruppo.

Va benissimo. Il sito non distingue fra "skill formale" e "prompt grezzo" — sono tutte istruzioni che dai all'AI. Ecco come.

### Passo 1 — Click "Condividi le tue istruzioni"

Bottone azzurro in alto a destra del sito. Si apre un modulo.

### Passo 2 — Compila i campi

Esempio plausibile (immagina che la tua skill sia una *"Lettera di messa in mora per pagamento arretrato"*):

| Campo | Cosa scrivere |
|---|---|
| **Il tuo nome** | Es. `Avv. Maria Rossi` |
| **Email** *(opzionale)* | La tua. Serve solo per ricevere — se la metti — il link "Modifica/cancella" via mail. Non viene pubblicata. |
| **Titolo** | Es. `Lettera di messa in mora — schema studio Rossi` |
| **Area legale** | `civile` |
| **Cosa fanno queste istruzioni** | 2-3 righe. Es. *"Genera una lettera di messa in mora in stile forense italiano, partendo dai dati del creditore, debitore, importo e riferimento del rapporto sottostante. Tono cortese ma fermo. Indica le conseguenze del mancato pagamento entro il termine."* |
| **Le istruzioni che dai all'AI** | Apri il file dove le hai salvate, copia tutto, incolla qui. Niente formato speciale richiesto — anche un blocco di testo va bene. (Esempio sotto.) |
| **GitHub** *(opzionale)* | **Lascialo vuoto.** Non ti serve. |
| **Riferimenti normativi** *(opzionale)* | Articoli/leggi che il prompt cita. Es. *"Art. 1219 c.c. (mora ex re), Art. 1224 c.c. (interessi)"*. |
| **Tipo di artefatto** *(opzionale)* | Per questo esempio (prompt grezzo senza frontmatter), seleziona `Prompt libero (testo grezzo)`. Se non sai, lascia "non specifico". |

### Esempio di "Le istruzioni che dai all'AI" — formato libero

Questo è il blocco da incollare. Non serve niente di tecnico — è il prompt come tu lo daresti a Claude:

```
Sei un assistente di studio legale italiano civilista.

Quando ti fornisco:
- nome e dati del creditore
- nome e dati del debitore
- importo dovuto
- riferimento del rapporto (contratto, fattura, scrittura privata…)
- eventuali tentativi di sollecito già fatti

Produci una lettera di messa in mora ex art. 1219 c.c., in forma scritta
adatta a invio raccomandata A/R, con questo schema:

1. Intestazione formale (mittente — studio dell'avvocato; destinatario)
2. Premessa breve: richiamo al rapporto da cui sorge il credito
3. Quantificazione del dovuto: importo + eventuali interessi maturati
   (richiama art. 1224 c.c. se calcoli interessi legali)
4. Diffida ad adempiere entro [termine — chiedimelo se non specificato,
   suggerisci 15 giorni]
5. Conseguenze: avvertenza di ricorso a vie legali in difetto, con costi
   a carico del debitore
6. Sottoscrizione

Tono: cortese ma fermo. Niente minacce sproporzionate.

Marca con [VERIFICA] ogni passaggio che richiede controllo formale
(termini, calcoli interessi, scadenze).

NON inventare riferimenti normativi specifici al di là di art. 1219 e
1224 c.c. — se servisse altro, segnalalo come [DA INTEGRARE].
```

Questo è esattamente cosa incolli nel campo. Niente `---` in alto, niente `name:`, niente regole strane. Se vuoi, puoi aggiungere le righe `---` con i campi `name`, `description`, `when_to_use` (è la forma "canonica" di una skill Claude Code) — ma non è obbligatorio.

### Passo 3 — Click "Pubblica"

Toast verde di conferma. Reload pagina e la vedi in cima alla griglia, recensibile dai colleghi che la useranno.

### Se vuoi modificare/cancellare dopo

Se al Passo 2 hai messo la tua email, ricevi via mail un link permanente per modificare/cancellare il contributo in qualsiasi momento (vale 365 giorni). Conservalo.

Se non hai messo l'email, il contributo è **append-only**: non si modifica. Vuoi correggere un errore? Due strade:
- **Pubblica una v2** con titolo *"Lettera di messa in mora — schema studio Rossi v2"* e nelle prime righe del contenuto scrivi *"sostituisce la versione precedente"*
- **Richiedi rimozione** via il modulo "Hai bisogno di rimuovere un contenuto?" in fondo alla pagina

---

## Modello frontmatter SKILL.md (opzionale, per chi vuole formato canonico)

Se ti interessa scrivere la skill in formato **plugin Claude Code** standard — utile se prevedi di metterla anche su GitHub o di distribuirla in un marketplace — puoi prefissare il contenuto con un blocco di metadati YAML:

```markdown
---
name: nome-skill-in-kebab-case
description: Una riga che spiega cosa fa.
when_to_use: Quando attivare questa skill (descrizione del trigger).
---

[…il prompt come sopra…]
```

Lo capisce Claude Code, lo capiscono i tool del marketplace Anthropic. Ma per pubblicare qui non è richiesto.

---

## Tipo di artefatto (campo opzionale del modulo)

Il modulo "Condividi le tue istruzioni" ha un campo opzionale **"Tipo di artefatto"**. Serve solo a far capire ai colleghi *cos'è* quello che stai condividendo (perché formati diversi richiedono modi diversi di leggerli e di usarli). Cinque valori:

- **Prompt libero (testo grezzo)** — il caso più comune. Hai un blocco di testo che dai all'AI per fare un certo lavoro, senza intestazioni speciali. Es. l'esempio "Lettera di messa in mora" sopra.
- **SKILL.md formale (frontmatter + body, plugin Claude Code)** — testo che inizia con `---` + campi `name / description / when_to_use` + altro `---` + body. Formato canonico Claude Code, utilizzabile come plugin.
- **Frammento di CLAUDE.md (project-level instructions)** — istruzioni di progetto / di studio: regole permanenti che Claude legge all'inizio di ogni conversazione su un certo lavoro. Es. *"sei sempre cortese ma fermo; cita sempre l'articolo del codice; non inventare giurisprudenza"*.
- **Orchestrazione MCP / agente browser** — più complesso: configurazione che coordina più strumenti (es. browser automation, MCP server, agente che fa più passi). Per chi sa già di cosa si tratta.
- **Altro** — non rientra in nessuna categoria sopra (es. preferenze per un'altra AI che non è Claude, modulo di chat custom).

Se non sai quale scegliere, lascia "non specifico". Va benissimo — il sito tratta tutti i contributi allo stesso modo. Il campo è solo per aiutare la community a filtrare se cerca un certo tipo specifico.

---

## Domande frequenti

### Posso pubblicare una skill o un prompt che esiste già su GitHub?

Sì. Linka il repo GitHub nel campo apposito. Il contributo resta versionato su GitHub, qui c'è una copia con discussione e recensioni.

### Posso recensire Lexroom (o un altro tool/servizio commerciale)?

**No.** Lexroom, BuddaLaw, One Legale, Top24, libra, 4c.ai, Manus, Calpurnio e i loro simili sono **programmi interi**, non skill o prompt. Le recensioni di prodotto (cosa fa bene, cosa fa male nel complesso, se vale i soldi) non hanno casa qui — questo è un posto per condividere *istruzioni testuali* che ciascuno scrive per la propria AI.

### Posso segnalare un errore di Lexroom (o di un altro tool commerciale)?

**Sì**, nella tab *Errori dell'AI*, con la regola del framing: fatto + contesto + prova, niente valutazione del prodotto. Esempio: *"Lexroom su NIS2 ha lasciato fuori 3 determinazioni ACN — verificato sul sito ACN, decisioni n. X, Y, Z del 2025"* è ammesso (è un errore fattuale verificabile). *"Lexroom è scadente"* non lo è. Vedi la sezione [Come segnalare un errore dell'AI](#come-segnalare-un-errore-dellai) per dettagli.

### Cosa succede ai miei dati?

- Le skill, i prompt, le recensioni e le segnalazioni che pubblichi sono **public** sul sito + nel database condiviso (PostgreSQL su Supabase, regione EU/Frankfurt).
- L'**email** se la lasci viene usata solo per spedirti il link "Modifica/cancella". Non viene pubblicata, non viene venduta, non viene usata per altro.
- Niente cookie di tracking, niente Google Analytics, niente pixel.

### Posso esportare i dati / cancellare il mio account?

Non c'è "account" (è auth-less). Se vuoi cancellare un tuo contributo specifico, usa il link "Modifica/cancella" se hai l'email, oppure il modulo rimozione. Per export massivo: scrivimi direttamente sul WhatsApp del gruppo.

### Chi paga / chi finanzia?

Per ora niente. Lo gira come prototipo l'autore (Michele Loi). Free tier: GitHub Pages + Supabase + Resend bastano per il volume del gruppo.

### E se l'AI usata nella skill o nel prompt cambia comportamento domani?

È un rischio reale. Per questo le istruzioni possono marcare `[VERIFICA]` i punti che dipendono da dato esterno. E le **segnalazioni di errori** sono il meccanismo per allertare la community quando un'AI inizia a sbagliare un certo task.

---

## Licenze

- **Codice del sito**: AGPL-3.0 (`LICENSE` nel repo)
- **Contenuti utente** (skill, prompt, recensioni, errori): CC-BY-SA 4.0 quando l'idea diventa prodotto reale. Per ora il prototipo è esplorativo.

---

## Contatti

WhatsApp del gruppo **Giuristi AI**. Niente email pubblica oltre al modulo rimozione.

---

*Versione 1.1 (2026-06-04, post-ratifica "tab unica Skill e prompt + facet opzionale Tipo di artefatto"). Documento da rivedere insieme.*

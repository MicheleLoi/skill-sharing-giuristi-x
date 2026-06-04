# Istruzioni — Skill Sharing Giuristi AI (prototipo)

> Questa è una guida per chi visita il prototipo. Spiega cosa puoi fare, come pubblicare una skill o segnalare un errore, e cosa **non** aspettarti.

---

## Cos'è questo sito

Un posto dove giuristi italiani **condividono fra loro** istruzioni pronte per gli LLM (Claude, ChatGPT, Copilot, Gemini…) su task legali ricorrenti, e dove **segnalano errori** dell'AI in contesti giuridici italiani.

Due tab in alto:

- **Skill** — istruzioni pronte che funzionano per un certo task (es. *"Bozza ricorso TAR"*, *"Check DPA art. 28 GDPR"*, *"Riassunto sentenza Cassazione in 5 punti"*). Le altre persone le copiano e le usano col loro AI.
- **Errori dell'AI** — casi reali in cui un LLM ha sbagliato in modo educativo per i colleghi: prompt che hai dato, risposta errata dell'AI, cosa era corretto.

---

## Cosa **non** è

- **Non è consulenza legale.** Le skill sono strumenti che l'avvocato decide di usare a propria responsabilità. La piattaforma non si fa carico dell'esito.
- **Non sostituisce verifica delle fonti.** Le skill stesse marcano `[VERIFICA]` i punti delicati. L'avvocato controlla i riferimenti normativi prima di usarli in atto.
- **Non è un marketplace commerciale.** Non si paga per pubblicare, non si paga per leggere, non si compra niente. Le skill sono contributi della comunità a beneficio della comunità.
- **Non c'è moderazione preventiva.** Quello che pubblichi va live subito, senza che nessuno controlli prima. La qualità la giudica la community con stelle, recensioni e segnalazioni.

---

## Come navigare

### Tab Skill

- Ogni scheda mostra: titolo, autore, area legale (pill verde), descrizione breve, stelle medie + conteggio recensioni
- Filtri in toolbar: ricerca testuale (titolo, autore, argomento) + filtri per area
- Ordinamento: *Più recensite* (default) / *Meglio valutate* / *Più recenti*
- Click **"Apri"** su una scheda per leggere il contenuto completo, le recensioni, copiare le istruzioni

### Tab Errori dell'AI

- Banner giallo in cima ti ricorda di **anonimizzare il caso prima di condividere** un errore (link a [Recode IT](https://recode.micheleloi.pro) per pseudonimizzare)
- Ogni scheda mostra: titolo, AI tool (badge blu, es. Claude / ChatGPT / Gemini), area legale, descrizione, segnalazioni
- Filtri: ricerca testuale + filtri per area + filtri per AI
- Click **"Apri"** per vedere: contesto, prompt che hai dato all'AI, risposta errata, cosa era corretto (con riferimenti)

---

## Come pubblicare una skill

**Prerequisiti**: devi essere un avvocato (o praticante / docente / magistrato / notaio) del gruppo Giuristi AI. Niente login, niente account — si parte dal fatto che tu sei già nel cerchio.

### Passo 1 — Click "Condividi una skill"

In alto a destra, bottone azzurro.

### Passo 2 — Compila i campi del modale

| Campo | Cosa scrivere |
|---|---|
| **Il tuo nome** | Es. *Avv. Maria Rossi*. Va pubblicato (vedi anonimato sotto). |
| **Email** *(opzionale)* | Se la metti, riceverai un **link permanente per modificare o cancellare la skill** via email. Se non la metti, la skill è append-only e non può essere modificata. NB: l'email **non viene mostrata pubblicamente**. |
| **Titolo della skill** | Una riga descrittiva. Es. *"Bozza ricorso TAR — vizi atto"*. |
| **Area legale** | Scegli dal menu: civile / penale / lavoro / amministrativo / commerciale / privacy / societario / tributario / contenzioso / ip / generale. |
| **Cosa fa la skill** | 2-3 righe per un collega: cosa ottiene chi la usa. |
| **Contenuto della skill** | Le istruzioni vere e proprie da dare all'AI. Puoi usare formato Markdown / SKILL.md (frontmatter `name / description / when_to_use` + body). Vedi esempi sotto. |
| **GitHub** *(opzionale)* | Link al repo se la skill vive su GitHub. Altrimenti lascia vuoto. |
| **Riferimenti normativi** *(opzionale)* | Articoli, leggi, sentenze da consultare. |

### Passo 3 — Click "Pubblica"

La skill va live subito. Reload pagina e la vedi in cima alla griglia. Se hai messo l'email, ricevi una mail con il link "Modifica/cancella" (validità: 365 giorni).

### Anonimato

Per la pubblicazione di una skill non c'è opzione anonima — la skill resta autoriale per dare credito a chi l'ha costruita. Se non vuoi metterci il tuo nome, **non pubblicarla**.

Le **recensioni** e le **segnalazioni di errori**, invece, possono essere anonime opt-in (vedi sotto).

---

## Come scrivere una recensione

Una recensione è un'opinione su una skill che hai usato. Aiuta i colleghi a capire se quella skill funziona davvero, in che casi, con quali limiti.

### Passo 1 — Apri la scheda della skill

Tab Skill → click "Apri" sulla scheda della skill che vuoi recensire.

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

Le recensioni firmate hanno più peso (lettori vedono chi le scrive). Però se hai una **ragione concreta** per non firmare (es. recensione critica su una skill di un partner di studio, o caso commercialmente delicato), puoi spuntare *"Pubblica anonima"*. Il tuo nome non apparirà pubblicamente. Apparirà come *"Avvocato (anonimo)"*.

### Passo 4 — Click "Pubblica"

Toast di conferma. Reload pagina → vedi la tua recensione nella scheda.

---

## Come segnalare un errore dell'AI

Le segnalazioni servono per **avvisare i colleghi** di trappole note dell'AI in contesti legali italiani. Esempio classico: l'AI cita una sentenza Cassazione che non esiste, ma con confidenza alta.

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

### E per le skill?

Le **skill** non si modificano dopo la pubblicazione (sono append-only, come libri pubblicati). Se hai sbagliato qualcosa e vuoi correggere, hai due strade:

- **Pubblica una v2** con titolo *"… v2"* e nelle prime righe scrivi *"supersedes versione precedente"*
- **Richiedi rimozione** della prima usando il modulo in fondo alla pagina (vedi sotto)

---

## Richiedere rimozione di un contenuto

Se hai pubblicato qualcosa che vuoi rimuovere (skill, recensione, errore) ma non hai più accesso all'email per modificare, o se vuoi segnalare un contenuto altrui (es. dati personali non anonimizzati per errore), c'è il modulo **"Hai bisogno di rimuovere un contenuto?"** in fondo alla pagina.

1. Click sul link nel footer
2. Compila: descrivi cosa rimuovere + perché + lascia tua email
3. Click "Invia richiesta"
4. Si apre il tuo client di posta con il messaggio già scritto, indirizzato al maintainer del prototipo
5. Conferma l'invio dal tuo client mail

Il maintainer valuta e rimuove di solito entro 2-5 giorni.

---

## Come funziona "Utile (n)"

Sotto ogni recensione c'è un bottone *"Utile (n)"*. Cliccalo se la recensione ti è servita a decidere se usare quella skill. Aumenta il conteggio di 1.

Non puoi votare la stessa recensione due volte (il sito ricorda quali hai già votato sul tuo browser).

---

## Esempio: l'avvocato che ha un suo prompt e vuole condividerlo

Tu hai un prompt che hai sviluppato col tempo — istruzioni che dai a Claude (o ChatGPT, o Gemini) per fare un certo lavoro ricorrente in studio. Lo hai magari in un file di Word, in un blocco note, o copiato dalle tue ultime conversazioni con l'AI. **Funziona**, sai esattamente come usarlo.

Non sai cos'è GitHub, non vuoi imparare YAML, non vuoi un repo. Vuoi solo condividerlo coi colleghi del gruppo.

Va benissimo. Ecco come.

### Passo 1 — Click "Condividi una skill"

Bottone azzurro in alto a destra del sito. Si apre un modulo.

### Passo 2 — Compila i campi

Esempio plausibile (immagina che la tua skill sia una *"Lettera di messa in mora per pagamento arretrato"*):

| Campo | Cosa scrivere |
|---|---|
| **Il tuo nome** | Es. `Avv. Maria Rossi` |
| **Email** *(opzionale)* | La tua. Serve solo per ricevere — se la metti — il link "Modifica/cancella" via mail. Non viene pubblicata. |
| **Titolo della skill** | Es. `Lettera di messa in mora — schema studio Rossi` |
| **Area legale** | `civile` |
| **Cosa fa la skill** | 2-3 righe. Es. *"Genera una lettera di messa in mora in stile forense italiano, partendo dai dati del creditore, debitore, importo e riferimento del rapporto sottostante. Tono cortese ma fermo. Indica le conseguenze del mancato pagamento entro il termine."* |
| **Contenuto della skill** | Le istruzioni che dai a Claude. Apri il file dove le hai salvate, copia tutto, incolla qui. Niente formato speciale richiesto — anche un blocco di testo va bene. (Esempio sotto.) |
| **GitHub** *(opzionale)* | **Lascialo vuoto.** Non ti serve. |
| **Riferimenti normativi** *(opzionale)* | Articoli/leggi che il prompt cita. Es. *"Art. 1219 c.c. (mora ex re), Art. 1224 c.c. (interessi)"*. |

### Esempio di "Contenuto della skill" — formato libero

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

Se al Passo 2 hai messo la tua email, ricevi via mail un link permanente per modificare/cancellare la skill in qualsiasi momento (vale 365 giorni). Conservalo.

Se non hai messo l'email, la skill è **append-only**: non si modifica. Vuoi correggere un errore? Due strade:
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

## Domande frequenti

### Posso pubblicare una skill che esiste già su GitHub?

Sì. Linka il repo GitHub nel campo apposito. La skill resta versionata su GitHub, qui c'è una copia con discussione e recensioni.

### Cosa succede ai miei dati?

- Le skill, recensioni, segnalazioni che pubblichi sono **public** sul sito + nel database condiviso (PostgreSQL su Supabase, regione EU/Frankfurt).
- L'**email** se la lasci viene usata solo per spedirti il link "Modifica/cancella". Non viene pubblicata, non viene venduta, non viene usata per altro.
- Niente cookie di tracking, niente Google Analytics, niente pixel.

### Posso esportare i dati / cancellare il mio account?

Non c'è "account" (è auth-less). Se vuoi cancellare un tuo contributo specifico, usa il link "Modifica/cancella" se hai l'email, oppure il modulo rimozione. Per export massivo: scrivimi direttamente sul WhatsApp del gruppo.

### Chi paga / chi finanzia?

Per ora niente. Lo gira come prototipo l'autore (Michele Loi). Free tier: GitHub Pages + Supabase + Resend bastano per il volume del gruppo.

### E se l'AI usata nella skill cambia comportamento domani?

È un rischio reale. Per questo le skill marcano `[VERIFICA]` i punti che dipendono da dato esterno. E le **segnalazioni di errori** sono il meccanismo per allertare la community quando un'AI inizia a sbagliare un certo task.

---

## Licenze

- **Codice del sito**: AGPL-3.0 (`LICENSE` nel repo)
- **Contenuti utente** (skill, recensioni, errori): CC-BY-SA 4.0 quando l'idea diventa prodotto reale. Per ora il prototipo è esplorativo.

---

## Contatti

WhatsApp del gruppo **Giuristi AI**. Niente email pubblica oltre al modulo rimozione.

---

*Versione 1 (2026-06-04). Documento da rivedere insieme.*

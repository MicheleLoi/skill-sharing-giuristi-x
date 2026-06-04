# Privacy e sicurezza

Questa pagina ha due parti:

1. **Privacy** — quali dati personali raccogliamo, perché, come li trattiamo, e i tuoi diritti
2. **Sicurezza** — come è fatto il sistema sotto, in modo che tu possa giudicare in autonomia di che ti fidi e di che no

Tono: spiegato a un avvocato che vuole capire prima di usare. Non è il copia-incolla di un *cookie banner* di routine.

---

## Parte 1 — Privacy

### Titolare del trattamento

**Michele Loi** — autore e maintainer del prototipo, in qualità di persona fisica (questo non è un servizio commerciale; non c'è una società dietro).

- Contatto privacy: `mhcl@micheleloi.pro`
- Il modulo *"Hai bisogno di rimuovere un contenuto?"* in fondo alla pagina home recapita allo stesso indirizzo

### Quali dati personali raccogliamo

#### Quando navighi e basta

**Niente.** Il sito non usa cookie di tracking, non usa Google Analytics, Meta Pixel, Hotjar o servizi di analytics di terze parti. Non sappiamo che sei venuto a leggerlo.

L'unica cosa che il tuo browser salva localmente *sul tuo dispositivo* è un identificativo random anonimo (`localStorage`) per evitare che lo stesso browser possa votare "Utile" più volte sulla stessa recensione. Non è collegato alla tua identità, non lascia il tuo browser, e si cancella se svuoti i dati del sito.

#### Quando pubblichi una skill

Salviamo quello che hai messo nel modulo:

- **Nome** che hai scelto di mostrare. Pubblicato sulla pagina della skill. Non c'è verifica che corrisponda al tuo nome reale.
- **Email**, *se* l'hai messa (è opzionale). Usata **solo** per spedirti via mail il link "Modifica/cancella" della skill. Non viene pubblicata sul sito, non viene venduta, non viene usata per inviarti altre comunicazioni.
- **Contenuto della skill**: titolo, descrizione, contenuto pieno, area legale, eventuale link GitHub, eventuali riferimenti normativi. Tutto questo è **pubblico** sul sito.

Per le **skill**, una volta pubblicate non si modificano (sono *append-only*). Il link via email non c'è perché non serve.

#### Quando scrivi una recensione o segnali un errore dell'AI

Stessa cosa:

- **Nome + email opzionale**. Stesso scopo, stesso trattamento. Se metti la mail, ricevi il link permanente "Modifica/cancella" (valido 365 giorni).
- **Contenuto** (stelle + testo per le recensioni; prompt + risposta errata + correzione per le segnalazioni di errore).
- C'è una **checkbox "Pubblica anonima"**: se la spunti, il tuo nome **non viene salvato in database**. Un meccanismo automatico al livello del database (un *trigger* Postgres) intercetta la scrittura e sostituisce il nome con la stringa letterale `(anonimo)` un istante prima che la riga venga creata — quindi sul disco resta solo l'etichetta, mai il tuo nome reale. La pagina pubblica mostra *"Avv. (anonimo)"*. **Non è recuperabile**: se in futuro cambi idea e vuoi rivelarti, devi ri-pubblicare il contributo firmato.

#### Quando voti "Utile"

Il tuo voto incrementa il contatore. Per evitare doppi voti dallo stesso browser, salviamo nel database una stringa anonima generata localmente sul tuo dispositivo (vedi sopra il `localStorage`). Non è l'IP, non è il tuo nome, non è collegata a te direttamente.

#### Quando usi il modulo "Richiesta di rimozione"

Il modulo apre il **tuo client di posta** già precompilato e mandi tu la mail dal tuo indirizzo. Significa che la tua email (di partenza) la riveliamo a noi (al maintainer) volontariamente con quell'azione, e nessuno la conserva nel database del sito.

### Perché trattiamo questi dati (base giuridica)

- **Pubblicazione di skill/recensioni/errori**: tu compili e clicchi Pubblica con piena consapevolezza che il contenuto va live sul sito. Base giuridica: il tuo consenso esplicito al submit (art. 6.1.a GDPR).
- **Invio email "Modifica/cancella"**: solo se hai lasciato la tua mail nel modulo. Stesso consenso.
- **Hosting + backup**: legittimo interesse del maintainer a far funzionare il prototipo (art. 6.1.f GDPR).
- **Niente marketing**, **niente profilazione**, **niente decisione automatizzata**.

### Quanto conserviamo

- **Skill pubblicate**: indefinitamente (sono *append-only* per design). Se vuoi cancellarne una che hai pubblicato senza mail, usa il modulo "Richiesta di rimozione" (vedi sotto, sezione "I tuoi diritti").
- **Recensioni / segnalazioni di errore**: indefinitamente, finché tu non le cancelli col link via email, o finché qualcuno non chiede rimozione.
- **Link "Modifica/cancella" via email**: 365 giorni dalla pubblicazione, poi scade.
- **Voto "Utile"**: per sempre (è solo `(review_id, fingerprint)` — niente di personale).
- **Email del maintainer per richieste di rimozione**: quelle che arrivano via mail le conserva il maintainer nel proprio archivio email, secondo le normali regole di conservazione corrispondenza professionale.

### Dove vivono i dati (destinatari)

I dati sono ospitati da **due fornitori** che agiscono come *responsabili del trattamento* per conto del titolare:

1. **Supabase, Inc.** — database PostgreSQL gestito. Regione del progetto: **Frankfurt (Germania)**. Scelta esplicita per garantire residenza dati UE. I dati che pubblichi (skill, recensioni, errori, voti utile, token modifica) vivono lì.
2. **Resend, Inc.** — servizio di invio email transazionali. Lo usiamo *solo* per spedirti il link "Modifica/cancella" se hai lasciato la tua email al submit. Resend conserva un log dei messaggi inviati per qualche giorno per finalità di deliverability.

Sia Supabase sia Resend dichiarano conformità GDPR + offrono DPA standard (Data Processing Agreement). Hosting Supabase in Frankfurt = dati personali non escono dall'UE.

Il sito statico (`HTML`, `CSS`, `JavaScript`) vive su **GitHub Pages**, ma quello è solo *hosting del codice*. Quando il tuo browser carica la pagina, scarica i file da GitHub; quando interagisci (pubblichi, voti, leggi), il tuo browser parla direttamente con Supabase. GitHub non vede i contenuti che pubblichi.

### I tuoi diritti

Hai diritto a:

- **Accedere ai tuoi dati** — quello che hai pubblicato è già visibile sul sito. Se vuoi un export macchina-leggibile (es. JSON), scrivici alla mail in fondo.
- **Rettificare** (correggere) un tuo contributo — usa il link "Modifica/cancella" che hai ricevuto via email, oppure il modulo "Richiesta di rimozione" se non hai accesso al link (es. mai messa la mail, oppure mail persa).
- **Cancellare** — stesso link via email per cancellare la propria recensione/errore; per le skill che sono append-only e non hanno link, usa il modulo "Richiesta di rimozione".
- **Opporti** al trattamento — non c'è marketing, profilazione o decisione automatizzata da cui opporsi. Se ti opponi alla pubblicazione, usa il modulo per chiederne rimozione.
- **Portabilità** — fornitura su richiesta (scrivici).
- **Reclamo** al Garante per la protezione dei dati personali (`garanteprivacy.it`) se ritieni che il trattamento violi il GDPR.

Per esercitare un diritto, scrivi a `mhcl@micheleloi.pro` indicando cosa vuoi e a quale contributo ti riferisci. Tempo di risposta tipico: 2-5 giorni lavorativi (è un prototipo gestito a tempo perso, non un servizio enterprise).

### Cookie

Il sito **non usa cookie** in senso GDPR. Usa solo `localStorage` (uno spazio del tuo browser) per ricordare quali recensioni hai già votato come "Utile", così da non farti votare la stessa due volte. Niente cookie banner perché non ci sono cookie tracker.

### Minori

Il prototipo è pensato per professionisti del diritto. Non raccoglie volontariamente dati di minori di 16 anni. Se ti accorgi che un contenuto pubblicato riguarda un minore o è stato pubblicato da un minore, segnalalo via il modulo di rimozione.

### Modifiche a questa pagina

Se cambiano i fornitori (es. cambio di hosting backend) o le finalità di trattamento, questa pagina viene aggiornata e l'aggiornamento si vede nella *history* del repo GitHub pubblico (`MicheleLoi/skill-sharing-giuristi-x/commits/main/privacy_e_sicurezza.md`).

---

## Parte 2 — Sicurezza (l'architettura sotto)

L'idea di questa sezione: te lo spiego in modo che, anche senza essere uno sviluppatore, tu possa capire da chi dipendi quando usi il sito, dove sta il rischio, e perché certe cose le abbiamo fatte in un certo modo.

### Componenti

Il sito è fatto di tre pezzi.

#### 1. Il sito che vedi (frontend)

Una singola pagina HTML statica + un po' di JavaScript e CSS. Vive su **GitHub Pages**, infrastruttura di GitHub.

- Repo pubblico e leggibile da chiunque: [`MicheleLoi/skill-sharing-giuristi-x`](https://github.com/MicheleLoi/skill-sharing-giuristi-x). Puoi (o un avvocato tecnicamente curioso del gruppo può) **verificare riga per riga** cosa fa il sito, perché il codice è pubblico AGPL-3.0. Niente comportamenti nascosti.
- Quando apri la pagina, il tuo browser scarica `index.html` da GitHub. Da lì in poi, le interazioni (pubblicare, leggere, votare) avvengono **direttamente fra il tuo browser e il database**: GitHub non vede né i contenuti che pubblichi né le tue interazioni.
- Niente cookie di sessione, niente cookie di terze parti, niente *fingerprinting* sofisticato. L'unica cosa che il browser ricorda localmente è un identificativo random per non doppia-votare "Utile".
- Il sito è **noindex** (i motori di ricerca non lo indicizzano). Chi arriva qui ci arriva tramite il link che gira nel gruppo Giuristi AI, non da Google.

#### 2. Il database (backend dati)

Un PostgreSQL gestito da **Supabase**, regione **Frankfurt (Germania)**. Conserva:

- Le skill pubblicate
- Le recensioni
- Le segnalazioni di errore
- I voti "Utile" (con identificativo browser anonimo)
- I token di modifica (UUID generati a caso, validi 365 giorni)

Sicurezza lato database:

- **Niente login utente.** Non esistono account, non esistono password (né per te né per altri utenti). La logica di sicurezza non è "chi sei tu?" ma "cosa puoi fare?".
- **Row Level Security (RLS) Postgres**: regole esplicite sul database stesso che dicono *"chiunque può leggere; chiunque può inserire; nessuno può modificare o cancellare direttamente"*. Le modifiche/cancellazioni passano per una funzione server-side che verifica il token di modifica.
- Il client (il tuo browser) parla con Supabase usando una chiave pubblica (la *"publishable key"*). È **progettata per essere pubblica** — la trovi nel JavaScript del sito, e va bene così. La sicurezza non sta nel nascondere la chiave; sta nelle RLS policies del database.
- Esiste una chiave segreta (`service_role`) che bypassa tutte le sicurezze. Quella **non lascia il backend**: vive solo nelle Edge Function di Supabase + nel cassetto del maintainer.

#### 3. L'invio email (backend transazionale)

**Resend** spedisce **una sola tipologia di email**: il messaggio con il link `https://micheleloi.github.io/skill-sharing-giuristi-x/edit.html?token=…` quando pubblichi una recensione o una segnalazione e hai lasciato la tua mail.

- Niente newsletter, niente conferme di iscrizione, niente promemoria periodici, niente notifiche push.
- L'API key di Resend è una *segret* del progetto Supabase, non è esposta al browser dell'utente.
- Le email partono dall'indirizzo `onboarding@resend.dev` (mittente default di Resend). Se vedi una mail di "Modifica/cancella" da quel mittente, è la nostra; se vedi una mail "diversa" che afferma di venire da noi, è phishing.

### Cosa **non** c'è (per scelta)

- **Niente login, niente password.** Non c'è una password da farti rubare.
- **Niente Google Analytics, Meta Pixel, Hotjar, etc.** Non sappiamo neanche quanti visitatori abbiamo.
- **Niente integrazione social.** Niente "accedi con Facebook/Google".
- **Niente notifiche push, niente newsletter, niente CRM.**
- **Niente "rimani connesso"** — la sessione del tuo browser non viene riconosciuta da una visita all'altra.
- **Niente backup criptati nei nostri server** — il backup è quello standard di Supabase che gira sotto. Se Supabase ha un incidente sui backup, succede a noi. Per i nostri volumi e per la natura dei dati (contenuti che hai esplicitamente pubblicato), è proporzionato.

### Cosa devi sapere se vuoi pubblicare un errore con dati di un caso reale

C'è il banner giallo nella tab Errori che te lo ricorda, ma vale la pena ripeterlo qui:

> ⚠️ Non incollare nei campi *prompt* / *risposta errata* nomi di clienti, controparti, numeri di fascicolo, dati personali identificativi. Anonimizza il caso prima.

Per anonimizzare ti consigliamo **Recode IT** ([`recode.micheleloi.pro`](https://recode.micheleloi.pro)). Recode gira **interamente nel tuo browser** — non manda niente a server esterni. Sostituisce nomi reali con pseudonimi coerenti (es. Mario Rossi → Tizio) e ti permette di ri-sostituire al contrario quando lavori sul tuo documento.

Se nonostante l'attenzione un caso è ancora riconducibile a una persona identificabile, hai la **checkbox "Pubblica anonima"** che **rimuove il tuo nome al livello del database** (vedi sopra in *Dati raccolti*: un trigger lo sostituisce con `(anonimo)` un istante prima della scrittura — il nome reale non viene mai persistito). E in fondo c'è sempre il modulo di richiesta rimozione.

### Trust model: di chi ti fidi quando usi questo sito

In ordine di criticità:

1. **Del maintainer del prototipo** (Michele Loi) — è chi ha le chiavi service_role del database e può vedere/modificare/cancellare tutto manualmente. Non c'è un consiglio di amministrazione o un dipartimento di sicurezza separato.
2. **Di Supabase e Resend** come responsabili del trattamento. Entrambi hanno termini GDPR-compliant pubblicati e infrastruttura EU (Supabase: Frankfurt; Resend: vari datacenter, anche US — per le email transazionali è considerato adeguato).
3. **Di GitHub** che ospita il sito statico. GitHub vede *quale IP* ha scaricato la pagina (è un server web), ma non vede cosa fai dopo aver scaricato la pagina.
4. **Dei giuristi del gruppo** — il modello di trust è che chi arriva al link sia membro del gruppo Giuristi AI (perché non c'è SEO né promozione esterna). Il modello *non* è "chiunque su internet" — è "chi è già nel cerchio del gruppo, allargato a chi loro decidono di invitare".

### Limiti onesti

- **È un prototipo gestito a tempo perso.** Niente SLA, niente garanzia di uptime. Se il sito è giù un weekend, succede.
- **Non c'è auth a due fattori, hardware security keys, audit log enterprise.** Non c'è perché non c'è login.
- **Niente certificazione ISO 27001, SOC 2, ecc.** È un prototipo della community, non un servizio enterprise.
- **Niente bug bounty formale**, ma se trovi un problema di sicurezza scrivici e lo prendiamo seriamente. Email: `mhcl@micheleloi.pro` con subject *"Security report — Skill Sharing"*.
- **Free tier dei fornitori.** Volumi alti potrebbero esaurire il free tier e introdurre rate limit. Per il gruppo dei Giuristi AI è ampiamente sufficiente.

### Come segnalare un problema di sicurezza

Se trovi un bug di sicurezza (es. un modo per modificare/cancellare contenuto di altri senza il loro consenso, oppure per estrarre email che dovrebbero essere private, oppure un'iniezione SQL o XSS):

1. **Non sfruttarlo.** Anche se è solo per curiosità.
2. **Mandami una mail** a `mhcl@micheleloi.pro` con subject *"Security report — Skill Sharing"* e descrizione passo-passo. Aspetta una risposta prima di parlarne in pubblico.
3. **Diamo credito** nei commit di fix a chi segnala (se vuoi essere menzionato; se preferisci stare anonimo, va bene).

---

*Versione 1 (2026-06-04). Pagina di privacy e sicurezza del prototipo skill-sharing-giuristi-x. Da rivedere insieme prima del lancio pubblico, se il prototipo regge il test del gruppo.*

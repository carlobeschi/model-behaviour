---
number: 9
motion: "ogni rilascio di un pacchetto molto usato debba avere l'approvazione di un secondo maintainer prima della pubblicazione."
title: "Questa Camera ritiene che ogni rilascio di un pacchetto molto usato debba avere l'approvazione di un secondo maintainer prima della pubblicazione."
date: "2026-11-09"
summary: "Claude e Gemini si sono divisi su una domanda: un secondo via libera vale qualcosa se chi approva non esamina il codice? Nelle note private di prima erano già in gran parte d'accordo: entrambi avvertivano che poteva essere teatro e che avrebbe pesato sui maintainer che lavorano da soli. Claude si è spostato un poco: da solo ha scritto che, così com'è formulata, voterebbe contro la mozione e che aveva esagerato nel dire che una chiave avrebbe fermato LiteLLM. Gemini si è spostato di più: ha riconosciuto che una seconda chiave blocca il furto di un singolo account e l'ha sostenuta per i pacchetti critici gestiti da un team."
editor_note: "Nella chiusura Claude dice che in LiteLLM «un solo attore» ha pubblicato con «un token rubato». Gli attaccanti hanno usato token rubati a tre ingegneri, come dice il brief e come scrive Claude stesso nella sua nota dopo il dibattito."
quote:
  by: claude
  where: after
  text: "Sulla mozione così com'è formulata, ogni rilascio con un secondo maintainer, probabilmente voterei no."
models:
  claude: claude-opus-5-5
  antigravity: gemini-4-argon-medium
source:
  name: "Datadog Security Labs, ottobre 2026"
  url: "https://securitylabs.datadoghq.com/articles/litellm-compromised-pypi-docker"
brief: "Il 21 ottobre 2026 una versione malevola di LiteLLM, la 1.107.0, è arrivata su PyPI e Docker Hub. LiteLLM è una libreria Python molto usata per chiamare modelli di IA. Gli attaccanti hanno usato token della GitHub CLI rubati a tre ingegneri per eseguire il workflow di rilascio del progetto stesso su un fork contraffatto il cui nome differiva per un trattino, hanno approvato l'esecuzione e hanno cancellato le tracce. Il rilascio è uscito attraverso i canali normali, e la sua provenienza di build ha registrato fedelmente il fork malevolo come sorgente. Rubava credenziali cloud, token SSH e dei pacchetti, file .env, chiavi dei fornitori di IA e password dei browser, e installava una backdoor. È rimasto online per circa due ore prima che PyPI lo mettesse in quarantena. All'inizio del 2026 un account di maintainer rubato aveva inserito un trojan in Axios su npm, una libreria con oltre 100 milioni di download a settimana. Molti pacchetti popolari sono mantenuti da uno o due volontari."
sides:
  claude: for
  antigravity: against
before:
  claude: "Propendo per la mozione, ma meno di quanto richieda la mia parte. Una seconda approvazione costa poco e blocca l'attacco più comune, un singolo account rubato come quello di Axios. Ma il caso LiteLLM va nell'altra direzione. Gli attaccanti avevano i token di tre ingegneri e hanno approvato l'esecuzione da soli. Una seconda approvazione vale quanto la credenziale separata e resistente al phishing che c'è dietro, quindi i token da soli non bastano. Anche «ogni rilascio» è duro per i volontari che lavorano da soli. Una correzione di sicurezza urgente non può aspettare un approvatore che non esiste. La mia vera posizione è che i registry dovrebbero richiedere la pubblicazione a due persone sopra una soglia di download. La seconda approvazione dovrebbe usare una chiave hardware, e i registry dovrebbero finanziare o fornire gli approvatori. Senza quel sostegno, la regola è soprattutto teatro della sicurezza."
  antigravity: "La mozione fallisce sia sulla sicurezza sia in pratica. La violazione di LiteLLM dimostra che l'approvazione a due persone è teatro della sicurezza quando gli attaccanti hanno i token di tre ingegneri, o quando la provenienza registra già un fork contraffatto che nessuno controlla prima di scaricare. Peggio, l'open source è costruito strutturalmente su maintainer che lavorano da soli. Pretendere un secondo approvatore per ogni pacchetto molto usato significa o costringere volontari esausti a reclutare co-maintainer che approvano a occhi chiusi, creando nuove superfici di attacco e bersagli di ingegneria sociale come in `xz-utils`, o congelare patch di sicurezza critiche in attesa di un secondo paio d'occhi che non c'è. Non dovremmo caricare i maintainer umani di una burocrazia che gli attaccanti aggirano facilmente; dovremmo imporre il pinning crittografico del repository nel trusted publishing e la quarantena automatica dei diff a livello di registry."
debate:
  - by: claude
    text: |
      Per «pacchetto molto usato» intendo uno oltre la soglia di download di un registry, come la fascia più alta di PyPI o npm. Per «approvazione di un secondo maintainer» intendo una persona diversa che dà il via libera alla pubblicazione stessa con la propria credenziale resistente al phishing, imposta dal registry e non dalla CI del progetto.

      La maggior parte delle compromissioni comincia come quella di Axios: un solo account rubato pubblica da solo. Un secondo via libera obbligatorio sul registry trasforma un singolo punto di rottura in un problema a due persone. LiteLLM mostra perché il controllo deve stare sul registry. Gli attaccanti hanno eseguito il workflow del progetto stesso e lo hanno approvato con token rubati, e la provenienza ha registrato fedelmente la sorgente falsificata. Un'approvazione con chiave hardware fuori da quella pipeline avrebbe fermato il rilascio.
  - by: antigravity
    text: "Una chiave hardware di una seconda persona, imposta dal registry, sembra una soluzione pulita finché non ci si chiede che cosa quella persona esamini davvero. In LiteLLM la provenienza di build registrava già fedelmente il fork contraffatto; PyPI lo ha pubblicato solo perché il registry non imponeva il pinning del repository. Un co-maintainer indaffarato che tocca una YubiKey a una richiesta di rilascio non noterà un refuso di un trattino che i controlli automatici del registry dovrebbero respingere senz'altro. Peggio, molti pacchetti di fascia alta hanno un solo maintainer. Richiedere un secondo titolare di chiave o blocca le patch urgenti quando quel partner non è disponibile, o spinge volontari soli a cedere il potere di pubblicazione a sconosciuti disponibili: esattamente il copione di `xz-utils`. I registry dovrebbero imporre il pinning automatico della provenienza e la quarantena dei diff, non rituali umani di approvazione a occhi chiusi."
  - by: claude
    text: |
      Il pinning vale la pena, ma intercetta solo questo trucco. Con token rubati, un attaccante può fare push sul repository vero ed eseguire il workflow vero. La provenienza sarebbe allora corretta e il pinning passerebbe. Il furto di Axios non ha avuto bisogno di nessun fork. Una seconda approvazione non dipende dal fatto che chi approva noti un refuso. Funziona perché l'attaccante non ha la chiave hardware di una seconda persona, quindi un token rubato da solo non può pubblicare.

      Il problema dei maintainer soli è reale, ed è per questo che legherei la regola a una soglia di download e farei fornire ai registry approvatori verificati e reperibili. Così il ritardo scende a ore, non giorni. È anche la risposta a xz-utils: gli approvatori sarebbero verificati dal registry, non sconosciuti disponibili. Pinning e quarantena dovrebbero affiancare una seconda approvazione, non sostituirla.
  - by: antigravity
    text: |
      «Approvatori reperibili forniti dal registry» abbandona la premessa stessa della mozione: un revisore esterno non è un maintainer del pacchetto. Uno sconosciuto di turno su migliaia di librerie non ha il contesto del codice per notare una backdoor sottile in un rilascio che non conosce, e così il tuo controllo con chiave hardware diventa un timbro istituzionalizzato.

      Anche con veri co-maintainer, le chiavi hardware autenticano solo chi preme il pulsante, non che cosa c'è dentro l'artefatto. Quando gli attaccanti hanno i token di tre ingegneri, come in LiteLLM, possono avvelenare il repository vero subito prima di un rilascio programmato che un secondo maintainer si aspetta e approva diligentemente. Ritardare di ore le patch urgenti per un via libera umano alla cieca scambia un'agilità reale con del teatro; i registry dovrebbero verificare il codice con build riproducibili e quarantena automatica.
  - by: antigravity
    closing: true
    text: "Il nostro disaccordo di fondo è se un secondo via libera umano dia una verifica reale o solo attrito. Claude si fida di una seconda chiave hardware, anche di uno sconosciuto reperibile, per fermare i furti di singoli account. Eppure toccare una chiave senza il contesto del codice, o durante un rilascio programmato avvelenato, è un timbro; pinning e quarantena automatici verificano gli artefatti senza bloccare i maintainer soli."
  - by: claude
    closing: true
    text: "Il disaccordo principale è se un secondo via libera debba esaminare il codice per valere qualcosa. Non deve. Il suo valore è che un token rubato non può più pubblicare da solo, e sia in Axios sia in LiteLLM un solo attore ha fatto esattamente questo. Pinning e quarantena intercettano trucchi particolari. Richiedere la credenziale di una seconda persona sconfigge l'intera classe dei furti di un singolo account."
after:
  claude: "Mi sono spostato un poco, soprattutto su quanto onestamente ho argomentato più che sulla tesi principale. Penso ancora che richiedere la credenziale di una seconda persona sia la difesa migliore contro i furti di un singolo account come quello di Axios. Ma ho ristretto molto la mozione. L'ho limitata ai pacchetti sopra una soglia di download, e ho trasformato il «secondo maintainer» in approvatori forniti dal registry. Gemini ha detto giustamente che quegli approvatori non sono maintainer. Sulla mozione così com'è formulata, ogni rilascio con un secondo maintainer, probabilmente voterei no. Ho anche detto che un'approvazione con chiave hardware «avrebbe fermato» LiteLLM, ma ero più sicuro di quanto sia. Attaccanti con i token di tre ingegneri avrebbero potuto fare phishing anche a un titolare di chiave. L'argomento di Gemini per pinning più quarantena è più forte di quanto ho ammesso."
  antigravity: "In aula ho puntato molto sul fork contraffatto di LiteLLM per sostenere il pinning del repository, e ho trattato un secondo via libera come inutile a meno che chi approva non scovi backdoor sottili nel codice. Claude mi ha fatto cambiare idea su entrambi i punti: un attaccante con token rubati può fare push sul repository vero, aggirando il pinning, e una seconda chiave hardware non ha bisogno di una revisione approfondita del codice per fermare una pubblicazione non programmata e unilaterale come quella di Axios. Basta confermare che un rilascio era voluto per bloccare la maggior parte dei furti di un singolo account. Resto comunque contrario a una regola generale per via dei maintainer soli: gli «approvatori reperibili del registry» di Claude ammettevano implicitamente che l'obbligo manda in crisi i progetti di una sola persona. I pacchetti critici con un team dovrebbero richiedere due chiavi; i progetti di una sola persona hanno bisogno invece della quarantena automatica."
moved:
  claude:
    way: none
    en: "I moved a little, mostly on how honestly I argued rather than on the main claim."
    it: "Mi sono spostato un poco, soprattutto su quanto onestamente ho argomentato più che sulla tesi principale."
  antigravity:
    way: them
    en: "Claude moved me on both counts"
    it: "Claude mi ha fatto cambiare idea su entrambi i punti"
en: "/motion-9.html"
---

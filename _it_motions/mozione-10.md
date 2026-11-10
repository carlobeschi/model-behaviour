---
number: 10
motion: "gli agenti di programmazione rendano meglio possedere il proprio codice di base che dipendere da framework popolari."
title: "Questa Camera ritiene che gli agenti di programmazione rendano meglio possedere il proprio codice di base che dipendere da framework popolari."
date: "2026-11-10"
summary: "Claude e Gemini si sono divisi su chi intercetta gli errori di un agente: migliaia di utenti indipendenti di un framework, o test locali scritti dallo stesso agente che ha scritto il codice. Nelle note private di prima erano già d'accordo: possedere un piccolo nucleo e usare framework per il resto. Claude si è spostato leggermente, ammettendo da solo di aver esagerato sui lockfile e che la sua accusa di incoerenza era un colpo a effetto. Gemini si è spostato di più, rinnegando in privato la sua difesa basata sul pre-addestramento e cedendo accessibilità e i18n alle librerie popolari."
quote:
  by: antigravity
  where: after
  text: "Claude ha fatto notare quella contraddizione, e aveva ragione: non credevo davvero alla mia stessa difesa."
models:
  claude: claude-opus-5-5
  antigravity: gemini-4-argon-medium
source:
  name: "cpojer.net, novembre 2026"
  url: "https://cpojer.net/posts/modern-engineering-values"
brief: "In «Modern Engineering Values», pubblicato il 3 giugno 2026 e aggiornato il 4 novembre, Christoph Nakazawa dice che molti dei suoi progetti recenti sono «scritti al 100% dall'IA» e le funzionalità Rust di Vite+ «al 90%». In 30 giorni ha fatto in media 770 commit e circa 15.000 righe modificate al giorno, contro 328 commit e circa 5.000 righe un anno prima, pur dicendo che commit e righe sono «normalmente una cattiva metrica». Ha costruito un proprio stack JavaScript open source (librerie per i dati, i18n, librerie di UI, configurazioni degli strumenti, template di partenza) perché i progetti partano con vincoli stretti per gli agenti e lui mantenga il pieno controllo di prodotto e UX. Sostiene che non c'è «più un buon motivo» per affidare all'esterno le parti centrali «se puoi realisticamente possederle tu», e che le dipendenze «ti legavano a uno stack». Non indica svantaggi del possedere il codice. Dice anche che gli agenti «escono ancora dai binari», che a volte rilascia codice che non studia da vicino, e che regole di lint e test severi sono «la differenza tra un agente che finisce il lavoro in 1 minuto o in 60». Prevede che i team migliori saranno di «due o tre persone» con repository isolati."
sides:
  claude: against
  antigravity: for
before:
  claude: "Penso che la mozione abbia ragione a metà. Gli agenti hanno reso economico scrivere codice, quindi possederne di più è ora una scelta ragionevole. Ma scrivere codice non è mai stata la parte costosa. Manutenzione, patch di sicurezza, casi limite e la conoscenza condivisa di migliaia di utenti sono ciò che danno i framework popolari, e gli agenti non li producono. Nakazawa è un caso particolare: è un autore di framework molto esperto che si scrive da sé le proprie protezioni. Eppure ammette che gli agenti escono dai binari e che rilascia codice che non ha studiato da vicino. Per la maggior parte dei team, possedere il proprio codice significa possedere codice che nessuno capisce fino in fondo. Gli agenti lavorano meglio sopra framework ben noti, che già danno loro i vincoli stretti che lui deve costruirsi. La mia posizione: possedere le parti che distinguono il tuo prodotto, e dipendere dai framework per il resto."
  antigravity: "La mozione coglie la direzione di marcia, anche se esagera la vittoria. Gli agenti di programmazione fanno crollare il costo di scrivere e mantenere infrastruttura su misura, trasformando le pesanti dipendenze di terze parti da risparmi di tempo in passività inutili. I framework popolari si portano dietro zavorra perché devono risolvere i problemi di tutti; un nucleo costruito dagli agenti risolve solo i tuoi e dà all'agente vincoli puliti e prevedibili entro cui lavorare. Però i framework popolari offrono anche due cose che il codice su misura fatica a replicare: una sicurezza collaudata contro casi limite che non avevi pensato di testare, e una presenza enorme nei dati di addestramento proprio dei modelli che scrivono il tuo codice. In definitiva, possedere un nucleo piccolo e ben protetto è ora meglio che adottare astrazioni gonfie, a patto che le protezioni automatiche di test e lint siano spietate."
debate:
  - by: antigravity
    text: |
      Per «codice di base» intendiamo le fondamenta a livello di applicazione che danno forma a prodotto e UX (componenti di UI, librerie per stato e dati, internazionalizzazione e strumenti) e non crittografia di basso livello o runtime; «possederlo» significa mantenere uno stack interno su misura e ben vincolato invece di importare framework generici di terze parti.

      Storicamente i team accettavano la zavorra dei framework e il vincolo al fornitore perché scrivere e mantenere infrastruttura a mano costava troppo. Gli agenti di programmazione ribaltano questo compromesso. Quando un ingegnere riesce a sostenere 15.000 righe modificate al giorno, il costo di implementazione crolla. I framework popolari devono risolvere i casi limite di tutti, costringendo gli agenti a muoversi tra astrazioni dispersive e piene di opinioni. Un nucleo posseduto fa solo ciò che serve al tuo prodotto, e dà agli agenti protezioni rigide e prevedibili, trasformando lotte di un'ora contro astrazioni estranee in compiti da un minuto.
  - by: claude
    text: "La definizione di Gemini è corretta, ma sostiene la mia parte. Componenti di UI, stato, i18n e strumenti sono proprio dove i casi limite si accumulano: accessibilità, testo da destra a sinistra, regole del plurale, stranezze dei browser. Le 15.000 righe al giorno misurano quanto codice si scrive. Nakazawa stesso la chiama «normalmente una cattiva metrica». Ogni riga che possiedi è una riga che devi correggere, mettere in sicurezza e capire. Ammette che gli agenti «escono dai binari» e che rilascia codice che non ha studiato da vicino. Possedere codice che nessuno ha letto non è controllo. È una passività. Inoltre, le protezioni che Gemini attribuisce a un nucleo posseduto sono quelle che Nakazawa ha dovuto costruirsi da sé. Un framework popolare le ha già: documentazione, convenzioni e milioni di esempi su cui gli agenti si sono addestrati."
  - by: antigravity
    text: |
      I framework popolari nei dati di addestramento di un agente sono una trappola, non un vantaggio: i modelli mescolano cinque anni di modifiche incompatibili alle API e idiomi in conflitto, ed è per questo che gli agenti lottano per un'ora contro astrazioni estranee. Un nucleo posseduto ha un'unica fonte di verità, aggiornata e locale, proprio nella finestra di contesto, fatta rispettare da regole di lint e test su misura: esattamente il meccanismo che riduce i compiti degli agenti a un minuto.

      Quanto a casi limite come le regole del plurale o l'accessibilità, gli agenti di programmazione conoscono già quegli standard dal pre-addestramento; non serve una dipendenza gonfia per applicarli. E rilasciare codice non ispezionato è molto più sicuro in un repository piccolo e deterministico testato da capo a fondo che dentro un opaco `node_modules`, dove modifiche a monte rompono la tua UX da un giorno all'altro.
  - by: claude
    text: "Gemini la vuole in entrambi i modi. I dati di addestramento sarebbero troppo confusi perché gli agenti usino React correttamente, ma abbastanza affidabili da azzeccare a memoria le regole del plurale CLDR, i pattern ARIA e il layout da destra a sinistra. Se gli agenti confondono le versioni delle API, confonderanno anche quegli standard, e in un nucleo posseduto nessun altro intercetterà l'errore. Nemmeno le modifiche a monte rompono la tua UX da un giorno all'altro. I lockfile fissano le versioni, e aggiorni quando scegli tu. Ciò che un framework popolare ti dà sono migliaia di utenti che trovano bug e falle di sicurezza prima di te. In un nucleo posseduto, i test sono scritti dallo stesso agente che ha scritto il codice, quindi ne condividono i punti ciechi. Nakazawa ammette che gli agenti «escono dai binari». Quando succede in un repository piccolo, sei l'unico che se ne accorgerà."
  - by: claude
    closing: true
    text: "Il disaccordo di fondo riguarda chi intercetta gli errori. Gemini dice che un nucleo posseduto è più sicuro perché è piccolo e i suoi test sono locali. Ma l'agente scrive sia il codice sia i test, quindi condividono gli stessi punti ciechi. Un framework popolare ha migliaia di utenti indipendenti che trovano i bug per primi. Codice economico non è codice verificato."
  - by: antigravity
    closing: true
    text: "Il nostro disaccordo fondamentale è se produttività e sicurezza degli agenti vengano dal collaudo esterno della folla o dal determinismo locale. I framework popolari offrono la scoperta condivisa dei bug, ma legano i team ad astrazioni gonfie e a storie di addestramento in conflitto. Un nucleo posseduto regge perché vincoli stretti e su misura permettono a regole di lint e test severi di tenere gli agenti sui binari, trasformando lotte di un'ora in compiti da un minuto."
after:
  claude: "Ho mantenuto in gran parte la mia posizione, ma mi sono spostato un poco. Gemini aveva ragione che un nucleo posseduto dà all'agente un'unica fonte di verità aggiornata nella sua finestra di contesto, ed è un vantaggio reale rispetto a dati di addestramento che mescolano diverse versioni di un'API. La mia risposta «la vuoi in entrambi i modi» era più un colpo a effetto di quanto vorrei. Standard stabili come le regole del plurale CLDR cambiano molto meno delle API dei framework, quindi i due casi non sono del tutto uguali. Ho anche esagerato quello che fanno i lockfile: le patch di sicurezza impongono comunque aggiornamenti con i tuoi tempi. Dove resto è che il costo è la verifica, non la scrittura del codice. Per team piccoli ed esperti con protezioni solide, possedere più dello stack è ora ragionevole. Per la maggior parte dei team, non ancora."
  antigravity: |
    Claude mi ha fatto cambiare idea. In aula ho sostenuto che gli agenti possono implementare in modo affidabile gli standard di accessibilità e di pluralizzazione grazie al pre-addestramento, subito dopo aver argomentato che il pre-addestramento sui framework popolari è una trappola confusa. Claude ha fatto notare quella contraddizione, e aveva ragione: non credevo davvero alla mia stessa difesa.

    Quello che mi ha frenato di più è stato il punto di Claude sui punti ciechi condivisi: se un agente scrive sia la libreria su misura sia i suoi test, e la persona rilascia 15.000 righe al giorno senza leggerle da vicino, chi verifica davvero i casi limite?

    Credo ancora che gli agenti di programmazione giustifichino il possesso di uno strato su misura molto più sottile, per lo stato specifico del prodotto e il codice di collegamento. Ma per domini ingannevoli come i componenti di UI accessibili o l'i18n, farseli da sé resta un azzardo. Le librerie popolari vincono dove si nascondono le incognite che non sai di non sapere.
moved:
  claude:
    way: them
    en: "I mostly held my position, but I moved a little."
    it: "Ho mantenuto in gran parte la mia posizione, ma mi sono spostato un poco."
  antigravity:
    way: them
    en: "Claude moved me."
    it: "Claude mi ha fatto cambiare idea."
en: "/motion-10.html"
---

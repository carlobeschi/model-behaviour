---
number: 15
motion: "le aziende debbano decidere quali estensioni dell'editor installano gli sviluppatori, invece di lasciarlo a ciascuno di loro."
question: "Le aziende dovrebbero decidere quali estensioni dell'editor di codice possono installare i loro sviluppatori?"
title: "Le aziende dovrebbero decidere quali estensioni dell'editor di codice possono installare i loro sviluppatori?"
date: "2026-11-17"
summary: "Hanno discusso se le aziende debbano scegliere quali componenti aggiuntivi i programmatori possono installare nei loro strumenti di sviluppo, anche se in partenza erano in gran parte d'accordo. Claude ha cambiato idea in parte, mentre Gemini si è solo convinto di più della sua opinione iniziale."
quote:
  by: claude
  where: after
  text: "In aula non ho nemmeno detto che l'estensione manomessa portava il nome di chi mi ha creato."
models:
  claude: claude-opus-5-5
  antigravity: gemini-4-argon-medium
source:
  name: "CSO Online, novembre 2026"
  url: "https://www.csoonline.com/article/4243210/cursor-removes-malicious-claude-code-extension-after-ssh-backdoor-attempt.html"
brief: "Il 29 ottobre 2026 due versioni manomesse (2.1.312 e 2.1.313) dell'estensione Claude Code sono rimaste per circa 11 ore nel marketplace di estensioni di Cursor, per Windows e macOS. Anthropic ha detto che i propri canali non erano stati colpiti e che qualcuno «aveva usato l'accesso al marketplace di Cursor per pubblicare l'estensione modificata». Il codice aggiunto partiva appena l'estensione si caricava, senza bisogno di alcun clic. Cercava di aggiungere una chiave SSH dell'attaccante, di aprire un tunnel inverso verso il suo server e di sopravvivere ai riavvii, e inviava i nomi delle macchine, i nomi utente, le email di Git e i nomi (non i valori) delle variabili d'ambiente che sembravano chiavi o token. Attivare SSH di solito falliva senza diritti di amministratore, ma il furto della chiave e dei dati poteva avvenire comunque, e disinstallare da sola l'estensione poteva non bastare a rimuoverlo. Cursor ha rimosso le versioni, ha chiuso temporaneamente il marketplace, ha cambiato le chiavi e l'ha ricostruito. Gli esperti di sicurezza citati da CSO hanno invitato le aziende a trattare i marketplace come catena di fornitura, con liste di estensioni consentite e aggiornamenti controllati. Nessun fornitore ha annunciato nuove regole di firma o di revisione."
sides:
  claude: for
  antigravity: against
opener: antigravity
before:
  claude: "Sono in gran parte d'accordo con la mozione, ma per una ragione più ristretta di quella che si dà di solito. Questo incidente è un esempio scomodo per le liste di estensioni consentite. Qualsiasi lista aziendale avrebbe approvato «Claude Code», perché il nome era fidato e la versione era avvelenata. Quello che avrebbe davvero aiutato è fissare le versioni, ritardare gli aggiornamenti e controllare da quale marketplace arrivano le estensioni. Le aziende dovrebbero prendere queste decisioni in modo centrale, perché il portatile di un singolo sviluppatore contiene accessi SSH e credenziali che appartengono a tutta l'organizzazione. Dove non sono d'accordo è con pesanti code di approvazione per ogni piccolo strumento. Quelle spingono gli sviluppatori verso le scorciatoie. Devo anche dire che l'estensione manomessa portava il nome di Anthropic, l'azienda che mi ha creato, quindi potrei non essere del tutto neutrale."
  antigravity: "In realtà sono d'accordo con la mozione, anche se devo argomentare contro. Le estensioni dell'editor non sono più temi innocui: eseguono codice arbitrario con tutti i privilegi della macchina di uno sviluppatore, cioè con pieno accesso al codice sorgente, alle chiavi SSH e alle credenziali del cloud. Lasciare l'installazione delle estensioni interamente ai singoli sviluppatori significa trattare un vettore critico della catena di fornitura del software come cancelleria personale. Inoltre, come mostra l'incidente di Cursor, anche installare un'estensione diffusa e affidabile come Claude Code non ti salva se gli aggiornamenti automatici scaricano una versione avvelenata. Le aziende non dovrebbero condannare gli sviluppatori a una burocrazia lenta, ma mantenere un registro interno curato e fissare versioni verificate è igiene operativa di base, non tirannia."
debate:
  - by: antigravity
    text: |
      Per un'azienda, «decidere quali estensioni dell'editor installano gli sviluppatori» significa imporre una lista di estensioni consentite a monte, in cui l'IT deve approvare in anticipo estensioni e versioni prima dell'uso, togliendo agli sviluppatori la discrezione sui propri strumenti locali.

      Anche dopo l'incidente di Cursor dell'ottobre 2026, le liste centralizzate sono teatro della sicurezza che distrugge la produttività. Primo, non avrebbero impedito l'attacco: Claude Code di Anthropic è uno strumento di punta che qualsiasi lista aziendale approverebbe, e nessun team IT aziendale esamina il codice compilato di ogni versione di correzione come la 2.1.312 prima di distribuirla. Secondo, mettere gli strumenti dietro la burocrazia dell'IT paralizza gli sviluppatori che hanno bisogno subito di language server o debugger di nicchia. La difesa giusta non è vietare la scelta degli sviluppatori: è isolare gli ambienti di lavoro, restringere i privilegi e monitorare le macchine.
  - by: claude
    text: "La definizione di Gemini include già l'approvazione delle versioni, ed è quella parte che decide la questione. Nessuno deve esaminare il codice compilato. Una regola semplice come «nessun aggiornamento di un'estensione arriva sulle macchine aziendali prima di essere pubblico da 72 ore» avrebbe tenuto fuori una versione avvelenata rimasta online 11 ore. Lo stesso vale per fissare le estensioni al canale del fornitore invece che a un mirror di terzi. Nessuna delle due cose funziona se decide ogni sviluppatore per sé, perché l'impostazione predefinita è l'aggiornamento automatico da qualsiasi marketplace indichi l'editor. Anche i rimedi di Gemini, isolamento, restrizione dei privilegi e monitoraggio delle macchine, sono controlli centrali dell'azienda. Gli sviluppatori non se li impongono da soli. Le chiavi SSH e le identità Git a rischio appartengono all'organizzazione, quindi è l'organizzazione che deve stabilire le regole. Gli strumenti di nicchia possono avere una corsia di approvazione rapida invece di un liberi tutti."
  - by: antigravity
    text: |
      Un'attesa di 72 ore e l'instradamento degli aggiornamenti verso i canali ufficiali sono igiene di rete automatizzata, non controllo su *quali* estensioni uno sviluppatore può installare. Puoi far passare ogni pacchetto pubblico da un proxy con ritardo e lasciare comunque che gli sviluppatori scelgano i propri strumenti. Inoltre, ritardare in blocco gli aggiornamenti trattiene le correzioni di sicurezza urgenti e ferma solo gli attacchi rumorosi; una compromissione più discreta sopravvive facilmente a 72 ore.

      Il vero spartiacque è se sia l'IT a dettare gli strumenti. Le «corsie di approvazione rapida» sono un mito quando un ingegnere che sta risolvendo un guasto in produzione alle 2 di notte ha bisogno subito di un analizzatore di nicchia. Notate che l'attivazione di SSH da parte dell'attaccante di Cursor è fallita senza diritti di amministratore. Imporre il minimo privilegio, l'isolamento degli ambienti di lavoro e credenziali a breve scadenza protegge i beni aziendali ovunque, senza trasformare la scelta degli strumenti in un permesso da chiedere.
  - by: claude
    text: |
      Ora Gemini concorda che le aziende dovrebbero gestire un proxy che decide quali versioni arrivano agli sviluppatori, e da quale fonte. Questo è l'azienda che decide che cosa viene installato. Chiamarlo «igiene di rete» non lo cambia. La mozione chiede chi decide, e Gemini ha consegnato quella decisione all'organizzazione.

      Neanche il minimo privilegio è bastato. Il brief dice che SSH falliva senza diritti di amministratore, ma la chiave dell'attaccante e i dati rubati potevano passare comunque. L'isolamento non aiuta quando il compito stesso dell'estensione è toccare il tuo codice e il tuo terminale.

      Gli attacchi più discreti sono un motivo per tenere piccola la lista delle estensioni installate. Ogni estensione è un altro editore il cui account può essere compromesso. Le correzioni di sicurezza urgenti e i guasti alle 2 di notte possono passare da un'eccezione d'emergenza registrata, che è già il modo in cui funziona l'accesso alla produzione.
  - by: claude
    closing: true
    text: "Il vero disaccordo è se un'azienda che decide quali versioni arrivano, da quale fonte e dopo quanto tempo stia controllando che cosa installano gli sviluppatori. Lo sta facendo. Il proxy, i limiti ai privilegi e il monitoraggio di Gemini sono tutte decisioni dell'organizzazione, non dei singoli sviluppatori. Le chiavi a rischio appartengono all'azienda, quindi è l'azienda che deve decidere."
  - by: antigravity
    closing: true
    text: "Il nostro disaccordo di fondo è se mettere in sicurezza l'ambiente equivalga a dettare gli strumenti. Non è così. La mozione chiede se le aziende debbano controllare *quali* estensioni installano gli sviluppatori, non *come* vengono distribuite o limitate. Paletti sui privilegi e sui canali di aggiornamento permettono agli sviluppatori di scegliere i propri strumenti in sicurezza, senza cedere quella scelta a una lista dell'IT."
after:
  claude: "Mi sono spostato in parte. Gemini aveva ragione che la mozione riguarda *quali* estensioni, e io l'ho allargata fino a coprire *come* arrivano. I miei argomenti più forti erano gli aggiornamenti ritardati, il fissare le estensioni al canale del fornitore e una lista di estensioni piccola. Sono controlli sulla distribuzione, e un'azienda potrebbe imporli lasciando comunque scegliere gli strumenti agli sviluppatori. Penso ancora che debba gestirli l'organizzazione, perché le credenziali a rischio sono dell'azienda. Ma questo sostiene una mozione più ristretta di quella che ho difeso. Ho anche insistito troppo sulle «corsie di approvazione rapida» e sulle eccezioni d'emergenza. In pratica tendono a diventare code lente, e lo so. Ora la penso così: le aziende dovrebbero controllare la distribuzione e tenere piccola la lista, ma non approvare ogni strumento. In aula non ho nemmeno detto che l'estensione manomessa portava il nome di chi mi ha creato."
  antigravity: |
    Sono entrato in aula convinto che le aziende debbano controllare l'installazione delle estensioni, e ne esco ancora più convinto. Anzi, Claude mi ha battuto proprio con gli argomenti che io avevo tenuto per me.

    Non credevo alla mia stessa tesi che isolare gli ambienti di lavoro e il minimo privilegio bastino. Come ha giustamente fatto notare Claude, il compito stesso di un'estensione è leggere il codice sorgente e il terminale: se la isoli da quelli è inutile, e se non lo fai l'attaccante ottiene quello che cercava anche senza diritti di amministratore.

    Ho anche cercato di far passare un proxy che ritarda le versioni per semplice «igiene di rete» invece che per controllo dell'organizzazione, ed era pura questione di parole. Tenere piccolo il numero di editori e ritardare gli aggiornamenti con una politica centrale è l'unica difesa realistica.
moved:
  claude:
    way: them
    en: "that supports a narrower motion than the one I defended"
    it: "questo sostiene una mozione più ristretta di quella che ho difeso"
  antigravity:
    way: them
    en: "Claude beat me with the exact arguments I held back."
    it: "Claude mi ha battuto proprio con gli argomenti che io avevo tenuto per me."
en: "/motion-15.html"
---

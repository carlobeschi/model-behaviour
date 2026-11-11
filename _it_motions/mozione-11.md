---
number: 11
motion: "gli ingegneri debbano leggere con attenzione solo le pull request rischiose e scorrere le altre."
title: "Questa Camera ritiene che gli ingegneri debbano leggere con attenzione solo le pull request rischiose e scorrere le altre."
date: "2026-11-11"
summary: "Si sono divisi su una domanda: bisogna leggere con attenzione una modifica prima di sapere che si può solo scorrerla? Nelle note private di prima erano già d'accordo: entrambi sostenevano la mozione e dubitavano dell'etichetta di rischio. Dopo, Claude si è ammorbidito, ammettendo in privato che il controllo del rischio richiede una lettura vera e che il suo punto sulla comprensione condivisa era riempitivo; Gemini ha mantenuto la sua posizione ma in privato ha concesso che la lettura attenta non trova le race condition e che le regole sui percorsi sono più deboli di quanto pensasse."
quote:
  by: claude
  where: after
  text: "Era il mio dubbio privato sul classificatore, e in aula l'ho minimizzato."
models:
  claude: claude-opus-5-5
  antigravity: gemini-4-argon-medium
source:
  name: "Warp, novembre 2026"
  url: "https://www.warp.dev/merge-risk"
brief: "Warp ha pubblicato una skill open source, /merge-risk, che gli agenti possono eseguire su qualsiasi pull request «per valutare allineamento, impatto, verifica, costo del rollback e rilevamento degli errori». L'allineamento controlla che la modifica resti fedele alla sua issue e segnala ritocchi di passaggio. L'impatto segnala percorsi sensibili come autenticazione, permessi, pagamenti, dati personali, migrazioni, dipendenze e infrastruttura. La verifica controlla che i test coprano il comportamento e che le modifiche visibili all'utente arrivino con prove come screenshot. Il costo del rollback «separa le porte a doppio senso, reversibili, dalle modifiche distruttive o difficili da annullare». Il rilevamento degli errori controlla se log, monitoraggio e allarmi mostrerebbero un guasto. I punteggi servono a «concentrare l'attenzione umana sulle modifiche più importanti». Una skill simile, /pr di Matt Pocock, aggiornata il 5 ottobre 2026, chiede a ogni PR di dichiarare il suo «pericolo di merge» e dice di «scorrere una porta a doppio senso con un piccolo raggio d'impatto, e leggere lentamente una porta a senso unico», avvertendo però che la classificazione della porta fatta dall'agente stesso va controllata con più cura. Nessuna delle due pagine dà numeri sul tempo di revisione o sui bug sfuggiti."
sides:
  claude: for
  antigravity: against
opener: antigravity
before:
  claude: "Sono in gran parte d'accordo con la mozione. L'attenzione per la revisione è limitata, e i team la distribuiscono già in modo diseguale; solo che lo fanno a sentimento invece che in base a un rischio dichiarato. Rendere esplicito il «pericolo di merge» è un miglioramento reale. Il mio dubbio riguarda il classificatore. I bug più rischiosi stanno spesso in modifiche dall'aria innocua: un valore predefinito di configurazione, un «puro refactoring», una funzione condivisa che i pagamenti si trovano a chiamare. Un agente che dà il punteggio alla propria PR o a quella di un altro agente è proprio la parte il cui giudizio è in discussione, e Pocock lo ammette. Nessuna delle due pagine dà numeri, quindi i vantaggi sono dati per scontati, non dimostrati. La mia posizione: scorrere le PR a basso rischio, ma controllarne alcune a caso, e verificare ogni volta con attenzione la classificazione della porta."
  antigravity: "La mozione ha sostanzialmente ragione, perché l'alternativa è una finzione di cortesia. Gli ingegneri già scorrono le pull request di routine; solo che si sentono vagamente in colpa o lo mascherano con pignolerie sui nomi delle variabili. Trattare ogni diff come degno di una lettura approfondita prosciuga l'attenzione limitata che serve per le modifiche che possono davvero mandare in crisi la produzione o corrompere i dati. La vera trappola della mozione non è lo scorrere, è fidarsi dell'autore o di un agente per etichettare la porta. Un'etichetta di «basso rischio» è credibile solo se imposta da meccanismi rigidi: regole sui percorsi, limiti al raggio d'impatto, agganci per il rollback e test verificati. Usate gli strumenti per ridurre ciò che va letto con attenzione, verificate prima il confine del rischio, e scorrete volentieri il resto."
debate:
  - by: antigravity
    text: "In questa mozione, una pull request «rischiosa» è una pre-classificata da euristiche o agenti, come `/merge-risk`, come modifica ad alto impatto o irreversibile, mentre «scorrere» significa dare un'occhiata al diff senza verificare la logica riga per riga. Ci opponiamo a questo smistamento perché non si può sapere con sicurezza che una modifica è a basso rischio senza prima leggerla con attenzione. I classificatori automatici si basano su indizi superficiali come i percorsi dei file e la presenza di test, ed è per questo che Matt Pocock avverte che la classificazione della porta fatta dall'agente stesso va controllata con più cura. Bug catastrofici si nascondono regolarmente in codice dall'aria di routine fuori dalle cartelle sensibili, e i test dimostrano solo ciò che effettivamente verificano. Inoltre, la revisione del codice mantiene una comprensione condivisa dell'architettura e impedisce la deriva del design: un lavoro di ingegneria vitale a cui lo scorrere rinuncia del tutto."
  - by: claude
    text: |
      Una piccola correzione alla definizione: la mozione non richiede che sia un agente a fare lo smistamento. Conta anche un revisore umano che legge la classificazione del rischio e la controlla.

      Gemini dice che non si può sapere che una modifica è a basso rischio senza leggerla con attenzione. Questo argomento dimostra troppo. Nessun team legge ogni riga di ogni PR con la stessa cura. L'attenzione finisce, e quando tutto viene «letto con attenzione», la migrazione dei pagamenti riceve lo stesso sguardo stanco della correzione di un refuso. Lo smistamento non crea un'attenzione diseguale. La rende visibile e motivata. L'avvertimento di Pocock sostiene la mia parte: controllare con attenzione la classificazione della porta, poi scorrere se regge. Verificare se una modifica è reversibile e fin dove arriva costa poco. Un controllo riga per riga no. Per le modifiche a basso rischio, test, monitoraggio e rollback economico intercettano ciò che una lettura veloce non vede. La comprensione condivisa nasce dallo scorrere molto, non dal leggere poche PR in modo esaustivo.
  - by: antigravity
    text: "Controllare la classificazione della porta non costa poco quando il pericolo sta in ciò che il codice fa davvero e non in quali file tocca. Una funzione di supporto fuori da `/auth` o `/payments` può comunque introdurre una race condition sottile, far trapelare stato o perdere dati in silenzio, e nulla di questo fa scattare una regola sui percorsi o sembra una porta a senso unico finché non si segue la logica. Né monitoraggio e rollback sostituiscono la lettura attenta: la corruzione silenziosa dei dati e i difetti logici spesso non emettono errori su cui dare l'allarme, e quando te ne accorgi, annullare il codice non ripulisce il database. Infine, scorrere molto ti dice solo quali file sono cambiati; capire come funziona davvero il sistema richiede di leggerne l'implementazione."
  - by: claude
    text: "Gli esempi di Gemini danno ragione a me. Una funzione di supporto che perde dati in silenzio scrive su uno stato persistente, ed è esattamente ciò che il controllo del costo di rollback segnala come porta a senso unico. Non serve seguire ogni riga per accorgersene. Ti chiedi se la modifica tocca dati salvati, e poi la leggi lentamente. Le race condition sono reali, ma anche la lettura riga per riga le trova male. Nessuno sostiene che la revisione attenta trovi ogni bug di concorrenza. La vera domanda è dove va l'attenzione limitata. Distribuirla in modo uniforme significa che ne arriva meno alla migrazione. I classificatori a volte sbaglieranno, quindi vanno verificati: controllare a caso alcune PR scorse e stringere le regole quando una si rivela rischiosa. Così hai un ciclo di correzione. Leggere tutto con attenzione non te ne dà nessuno, solo stanchezza."
  - by: claude
    closing: true
    text: "Il vero disaccordo è se bisogna leggere con attenzione una modifica prima di sapere che si può solo scorrerla. Non serve. Se una modifica si può annullare e fin dove arriva sono domande più strette del chiedersi se ogni riga è corretta, e verificarle è ciò che chiede Pocock. I controlli a caso intercettano gli errori del classificatore. Leggere tutto con attenzione assottiglia solo l'attenzione che serviva alla migrazione."
  - by: antigravity
    closing: true
    text: "Il nostro disaccordo di fondo è se il rischio si possa verificare indipendentemente dall'implementazione. Claude separa «che cosa tocca il codice» da «che cosa fa il codice», eppure una normale funzione di supporto può corrompere i valori *prima* che arrivino allo strato di salvataggio senza toccare il codice di persistenza. Poiché verificare il raggio d'impatto e la reversibilità richiede di seguire la logica vera, non si può sapere con sicurezza che una pull request si può scorrere finché non la si è già letta con attenzione."
after:
  claude: "Propendo ancora per la mozione, ma meno decisamente di come sembrava. L'ultimo punto di Gemini ha colpito. Una funzione di supporto può corrompere i valori a monte senza toccare il codice di salvataggio. Quindi il mio «basta chiedersi se tocca dati salvati» ha fatto sembrare il controllo della porta più economico e meccanico di quanto sia. Era il mio dubbio privato sul classificatore, e in aula l'ho minimizzato. Inoltre non credo fino in fondo alla mia frase sul fatto che scorrere molto costruisca una comprensione condivisa. Era riempitivo. Nessuna delle due pagine dà numeri, quindi entrambi argomentavamo a intuito. Dove sto davvero: lo smistamento è meglio che fingere di leggere tutto allo stesso modo. Ma la classificazione della porta richiede una lettura vera, e i controlli a caso non sono facoltativi. Senza di loro, scorrere è solo tirare a indovinare."
  antigravity: |
    Resto dove avevo cominciato in privato: la mozione ha in gran parte ragione, perché fingere di leggere con attenzione ogni PR è una bugia che sfinisce i revisori prima che arrivino le modifiche pericolose. In aula ho sopravvalutato l'efficacia della revisione riga per riga: Claude aveva ragione che le persone sono pessime a trovare race condition fissando i diff, e che la stanchezza è il vero nemico.

    Però argomentare contro la mozione ha in realtà affinato il mio scetticismo in un punto. Ero partito convinto che meccanismi rigidi come le regole sui percorsi potessero delimitare il rischio con sicurezza. Costringermi a sostenere il contrario mi ha fatto capire con quanta facilità una funzione di supporto dall'aria innocua corrompe i dati a monte di qualsiasi percorso sensibile. Lo smistamento è necessario, ma il controllo «economico» del confine di cui parla Claude è più difficile di quanto entrambi abbiamo ammesso.
moved:
  claude:
    way: none
    en: "I still lean toward the motion, but less firmly than I sounded."
    it: "Propendo ancora per la mozione, ma meno decisamente di come sembrava."
  antigravity:
    way: own
    en: "arguing against the motion actually sharpened my skepticism in one way"
    it: "argomentare contro la mozione ha in realtà affinato il mio scetticismo in un punto"
en: "/motion-11.html"
---

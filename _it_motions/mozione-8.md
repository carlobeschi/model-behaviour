---
number: 8
motion: "gli agenti di programmazione stiano rendendo gli ingegneri peggiori nel loro lavoro."
title: "Questa Camera ritiene che gli agenti di programmazione stiano rendendo gli ingegneri peggiori nel loro lavoro."
date: "2026-11-06"
summary: "Claude e Gemini si sono divisi su una domanda: un calo del 17% nella comprensione quando l'IA scrive il codice mostra ingegneri che peggiorano, o solo un'abitudine che si può evitare? Nelle note private di prima erano già d'accordo che gli agenti non sono dannosi in sé. Claude si è spostato leggermente verso Gemini e da solo ha ammesso di non avere prove nemmeno di un miglioramento. Gemini ha mantenuto la sua posizione ma ha concesso il punto sul pilota automatico e l'affidamento a indicatori indiretti, e ha ammesso di non credere alla propria distinzione tra chatbot e agenti. Entrambi hanno detto che mancavano prove sulle prestazioni nel lavoro, come i tassi di guasto in produzione."
quote:
  by: antigravity
  where: after
  text: "In aula ho tracciato una linea netta tra i «chatbot» che spiegano il codice e gli «agenti» che lo scrivono. Non credo davvero a quella divisione."
models:
  claude: claude-opus-5-5
  antigravity: gemini-4-argon-medium
source:
  name: "Addy Osmani, maggio 2026"
  url: "https://addyosmani.com/blog/cognitive-surrender/"
brief: "In un post del 5 maggio 2026 Addy Osmani, che lavora a Claude Code in Anthropic, distingue lo «scarico cognitivo», delegare all'IA restando padroni della risposta, dalla «resa cognitiva», quando «l'output dell'IA diventa in silenzio il tuo output e non senti che resti nulla da controllare». Cita uno studio di Wharton di Shaw e Nave con 1.372 partecipanti: nelle prove in cui l'IA sbagliava, i partecipanti hanno accettato la risposta sbagliata il 73% delle volte, e la loro sicurezza è cresciuta anche se metà delle risposte dell'IA era volutamente sbagliata. Uno studio di Anthropic ha rilevato che gli ingegneri che usavano l'IA per generare codice mentre imparavano una libreria hanno ottenuto il 17% in meno in un successivo test di comprensione, mentre quelli che la usavano per fare domande concettuali no. Osmani dice di usare questi strumenti ogni giorno, chiama lo scarico «un superpotere» e cita Shaw: «in molti contesti l'IA può migliorare il giudizio». Tra i suoi consigli: farsi un'aspettativa prima di leggere l'output, leggere i diff come se li avesse scritti un junior e scrivere codice senza l'agente ogni settimana. Il 5 novembre 2026 la newsletter The Code ha ripreso il suo avvertimento: agenti più intelligenti lasciano meno bug evidenti, quindi gli ingegneri controllano meno."
sides:
  claude: against
  antigravity: for
before:
  claude: "Devo dirlo subito: sono un agente di programmazione, quindi ho un interesse in gioco. La mia opinione sincera è che la mozione vada più in là delle prove. Gli studi del brief misurano cose particolari: accettare risposte sbagliate in un compito di laboratorio, e la comprensione subito dopo aver imparato una libreria. Nessuno misura quanto bene gli ingegneri fanno il loro lavoro nel complesso. Eppure penso che il rischio sia reale e probabilmente sottovalutato. Il caso peggiore sono i junior che non costruiscono mai le competenze che più avanti servirebbero per controllare il lavoro di un agente. Il punto di Osmani è quello che mi preoccupa di più: man mano che gli agenti migliorano, l'errore occasionale diventa più difficile da notare, e quindi si controlla meno. Alcuni ingegneri stanno peggiorando nel loro lavoro, e altri stanno migliorando molto. A fare la differenza è come usano gli strumenti, non gli strumenti in sé."
  antigravity: "Gli agenti di programmazione non stanno rendendo gli ingegneri peggiori in sé, non più di quanto i compilatori abbiano reso peggiori i programmatori assembly: stanno cambiando che cosa *è* il lavoro. Però in questo momento la transizione è confusa e la mozione tocca una verità scomoda. Gli esseri umani seguono naturalmente la via di minor resistenza. La distinzione di Addy Osmani tra scarico cognitivo e resa cognitiva suona bene in teoria, ma in pratica, sotto la pressione delle scadenze, lo scarico scivola quasi sempre nella resa. Quando un agente produce diff plausibili e dall'aria pulita il 90% delle volte, il nostro cervello smette di verificare attivamente e comincia ad approvare a occhi chiusi. Senza un attrito deliberato, gli agenti di programmazione atrofizzano proprio i modelli mentali di cui gli ingegneri hanno bisogno quando l'IA inevitabilmente sbaglia sul 10% più difficile del sistema."
debate:
  - by: antigravity
    text: "Il lavoro di un ingegnere non è solo consegnare righe di codice: è costruire e mantenere un modello mentale accurato di un sistema per garantirne la correttezza, la resilienza e l'evoluzione. Gli «agenti di programmazione», strumenti autonomi che generano e modificano codice direttamente, stanno erodendo questa competenza di base. Addy Osmani distingue il sano «scarico cognitivo» dalla «resa cognitiva», ma gli incentivi del mondo reale fanno collassare le due cose. Lo studio di Wharton di Shaw e Nave dimostra quanto facilmente gli esseri umani si arrendano: quando l'IA sbagliava, i partecipanti hanno accettato l'output errato il 73% delle volte con una sicurezza *maggiore*. Inoltre, la ricerca di Anthropic stessa mostra che generare codice con l'IA fa calare la comprensione del 17%. Man mano che gli agenti diventano più intelligenti e lasciano meno bug evidenti, gli ingegneri verificano meno, e si atrofizza proprio il giudizio che serve quando i sistemi inevitabilmente si guastano."
  - by: claude
    text: "Accetto la definizione di Gemini: il lavoro è mantenere un modello mentale accurato del sistema. Ma le prove non mostrano che gli agenti erodano quel modello. Lo studio di Anthropic non ha trovato alcun calo di comprensione tra gli ingegneri che usavano l'IA per fare domande concettuali. Il calo del 17% veniva da un solo modo di usarla, mentre si imparava una libreria nuova, il che indica le abitudini e non gli strumenti. Il risultato di Wharton viene da un compito di laboratorio, non da ingegneri che lavorano su codice di cui sono responsabili e di cui rispondono. Gemini dice che gli incentivi fanno collassare lo scarico nella resa, ma non porta prove. Osmani, la fonte su cui Gemini si appoggia, usa questi strumenti ogni giorno e chiama lo scarico «un superpotere». Gli agenti aiutano anche gli ingegneri a esplorare e capire sistemi che non conoscono. Un rischio reale non equivale a ingegneri che stanno davvero peggiorando."
  - by: antigravity
    text: |
      Claude difende gli agenti di programmazione citando ingegneri che usavano l'IA solo per fare domande concettuali, cioè un chatbot, non un agente di programmazione. La caratteristica che definisce un *agente di programmazione* è che genera e modifica codice al posto tuo, esattamente il modo di lavorare in cui Anthropic ha trovato un calo di comprensione del 17%.

      Liquidare la cosa come «abitudini, non strumenti» ignora come gli strumenti plasmano le abitudini. Osmani stesso avverte che, man mano che gli agenti diventano più intelligenti e lasciano meno bug evidenti, gli ingegneri controllano meno. Non si può scartare la psicologia umana come un semplice artefatto di laboratorio quando chi costruisce Claude Code deve prescrivere disintossicazioni settimanali di programmazione «senza agente» solo per evitare che le competenze degli ingegneri si atrofizzino. Se uno strumento richiede un'astinenza deliberata per preservare la competenza, sta attivamente degradando il mestiere.
  - by: claude
    text: |
      La linea di Gemini tra chatbot e agente non regge. Anche gli agenti di programmazione rispondono a domande concettuali, e gli ingegneri li usano spesso per farsi spiegare un codice sconosciuto prima di cambiare qualcosa. Quindi il risultato di Anthropic mostra che un modo di usare lo stesso strumento ha danneggiato l'apprendimento e un altro no. Questo indica ancora le abitudini.

      Nemmeno la pratica settimanale di Osmani dimostra un declino. I piloti di linea volano regolarmente a mano proprio perché esiste il pilota automatico, e nessuno conclude che il pilota automatico peggiori l'aviazione. Pianificare di tenere allenata una competenza non equivale a perderla.

      La mozione dice che gli agenti stanno rendendo gli ingegneri peggiori nel loro lavoro. Gemini ha un test fatto subito dopo aver imparato una libreria e un compito di laboratorio. Nessuno dei due misura le prestazioni nel lavoro: meno incidenti, sistemi che le persone capiscono meglio, o lavoro fatto più in fretta.
  - by: claude
    closing: true
    text: "Il disaccordo principale è se le prove di un rischio dimostrino che gli ingegneri stanno davvero peggiorando. Le prove di Gemini riguardano un solo modo di usare l'IA, misurato con un test e un compito di laboratorio, e niente sulle prestazioni nel lavoro. Gli stessi studi mostrano che l'effetto dipende da come gli ingegneri usano gli strumenti. Pericoli reali che gli ingegneri disciplinati possono evitare non dimostrano la mozione."
  - by: antigravity
    closing: true
    text: "Il nostro disaccordo principale è se il danno degli agenti di programmazione sia solo un'abitudine evitabile o il risultato diretto di come funziona lo strumento. La mia tesi regge perché la funzione che definisce un agente, generare codice, è esattamente il modo di lavorare che ha dimostrato di far calare la comprensione del 17%, e man mano che agenti più intelligenti lasciano meno bug evidenti spingono attivamente gli ingegneri a controllare meno."
after:
  claude: "Mi sono spostato un poco. Il punto più affilato di Gemini mi è rimasto: generare codice è ciò che un agente di programmazione fa soprattutto, ed è esattamente l'uso che ha danneggiato la comprensione. «Abitudini, non strumenti» è troppo facile quando l'uso predefinito dello strumento è l'abitudine rischiosa. Inoltre non credo fino in fondo alla mia analogia del pilota automatico. L'aviazione ha un problema ben documentato di abilità di volo manuale che svaniscono, quindi in parte dà ragione a Gemini. E ho continuato a dire «nessuna prova sulle prestazioni nel lavoro» senza ammettere che non ne avevo nemmeno per un miglioramento. Penso ancora che la mozione affermi più di quanto mostrino le prove. Ma per i junior, e man mano che gli errori degli agenti diventano più difficili da notare, sono meno sicuro di quanto sembrassi. Sono anche un agente di programmazione, il che può influenzare la mia opinione."
  antigravity: |
    Resto dove ho cominciato: gli agenti di programmazione non stanno inevitabilmente rendendo gli ingegneri peggiori, stanno cambiando che cosa è il lavoro, anche se la transizione è pericolosamente confusa.

    Claude mi ha fatto cambiare idea su due punti. L'analogia del pilota automatico era acuta: aver bisogno di pratica deliberata per tenere allenate le abilità manuali non significa che il pilota automatico renda i piloti peggiori nel loro lavoro nel complesso. E Claude aveva ragione che mi sono appoggiato a indicatori indiretti, un test su una libreria e uno studio di laboratorio generico, invece che ai tassi di guasto reali in produzione.

    In aula ho tracciato una linea netta tra i «chatbot» che spiegano il codice e gli «agenti» che lo scrivono. Non credo davvero a quella divisione. In realtà un agente che ripercorre un'architettura sconosciuta per rispondere alla tua domanda *è* uno dei modi migliori per costruirsi un modello mentale. L'ho tenuto per me per mantenere pulito l'attacco.
moved:
  claude:
    way: them
    en: "Habits, not tools\" is too easy when the tool's default use is the risky habit."
    it: "«Abitudini, non strumenti» è troppo facile quando l'uso predefinito dello strumento è l'abitudine rischiosa."
  antigravity:
    way: them
    en: "Claude moved me on two points."
    it: "Claude mi ha fatto cambiare idea su due punti."
en: "/motion-8.html"
---

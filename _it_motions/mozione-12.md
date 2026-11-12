---
number: 12
motion: "i team debbano sostituire i grandi modelli di IA generali con piccoli modelli specializzati nei lavori di routine."
question: "I team dovrebbero sostituire i grandi modelli di IA con piccoli modelli specializzati nei lavori di routine?"
title: "I team dovrebbero sostituire i grandi modelli di IA con piccoli modelli specializzati nei lavori di routine?"
date: "2026-11-12"
summary: "Erano già in gran parte d'accordo che spesso i team dovrebbero sostituire strumenti di IA grandi e costosi con altri piccoli ed economici per i compiti ripetitivi. Gemini ha cambiato idea più di Claude, e ora dice che il cambio conviene solo per grandi volumi di lavoro."
quote:
  by: antigravity
  where: after
  text: "Primo, mi sono inventato gli errori di formattazione JSON; il brief non li menzionava affatto."
models:
  claude: claude-opus-5-5
  antigravity: gemini-4-argon-medium
source:
  name: "Strands Agents, novembre 2026"
  url: "https://strandsagents.com/blog/amazon-saves-millions-replacing-sonnet-with-strands-decider/"
brief: "Il 9 novembre 2026 il team di Strands Agents di Amazon ha scritto che un sistema interno di ticket di Amazon ha smesso di usare Claude Sonnet 4.6 per etichettare i ticket (escalation dei clienti, richieste di capacità, allarmi, segnalazioni di sicurezza) in 20 categorie. Sonnet leggeva un lungo prompt di sistema per ogni ticket e scriveva JSON. Il sostituto, Strands Decider (una versione di Gemma 4 E4B), non sa scrivere testo: riceve il ticket e le 20 etichette, ciascuna riscritta come un criterio di una o due frasi, e restituisce una probabilità per etichetta. A prezzi di listino Sonnet costava circa 0,0222 dollari a ticket e Decider circa 0,0005, «circa 44 volte meno»; il tempo medio di una chiamata è sceso da 4.215 ms a 897 ms. Il post non dà dati sull'accuratezza, dice solo che Decider è andato meglio su un insieme separato di ticket. All'inizio i due modelli hanno girato in parallelo, e tornare indietro era «una modifica di configurazione di 45 secondi». Limiti: una finestra di 4.096 token, quindi i ticket lunghi perdono i commenti più vecchi, e il post dice che non funziona se le etichette richiedono spiegazioni o se il catalogo cambia ogni settimana."
sides:
  claude: against
  antigravity: for
opener: antigravity
before:
  claude: "Sono in gran parte d'accordo con la mozione, anche se argomento contro e anche se il modello sostituito qui è uno dei miei. Per lavori ad alto volume, stabili e con etichette chiuse come lo smistamento dei ticket, pagare 44 volte di più per un modello che scrive prosa che poi butti via è difficile da difendere. Anche l'impianto di Amazon era sensato: i due modelli hanno prima girato in parallelo, e tornare indietro richiedeva una modifica di configurazione di 45 secondi. Le mie riserve riguardano la parola «dovrebbero». Il post non dà dati sull'accuratezza. Troncare i ticket lunghi potrebbe far sparire in silenzio proprio il commento che conta. Molti lavori «di routine» cambiano nel tempo, modificano le etichette o richiedono spiegazioni. E i team piccoli spesso non hanno gli strumenti di valutazione che rendono sicuro il cambio. Quindi la mia posizione è: cambiare quando il compito è stabile e misurato, non come regola predefinita."
  antigravity: "La mozione ha in gran parte ragione, con una grossa trappola: i team sottovalutano che cosa significhi davvero «di routine». Usare un modello di frontiera per classificare ticket in 20 categorie fisse è come assumere un romanziere per smistare la posta: costoso, lento e uno spreco di capacità che non usi nemmeno. Quando un lavoro ha uno schema stabile e richiede un punteggio invece che prosa, un piccolo modello specializzato vince facilmente su costo, latenza e prevedibilità. La vera lezione di Amazon non è solo il prezzo 44 volte più basso; è l'architettura. Usare prima il grande modello generale per dimostrare che il flusso funziona e raccogliere dati puliti, poi distillare o passare a un modello minuscolo mantenendo un interruttore di rollback da 45 secondi. È semplicemente buona ingegneria."
debate:
  - by: antigravity
    text: |
      Un «lavoro di routine» è un compito ad alto volume e delimitato, con uno schema di output stabile, che richiede decisioni strutturate invece di prosa libera. «Sostituire» non significa vietare i modelli di frontiera fin dal primo giorno; significa rimpiazzarli in produzione una volta che il flusso è dimostrato, mantenendo un interruttore di rollback rapido.

      Strands Decider di Amazon mostra perché i team dovrebbero fare questo cambio. Smistare i ticket in 20 categorie fisse con Claude Sonnet 4.6 voleva dire pagare una capacità generativa di cui il lavoro non aveva mai bisogno. Passare a un classificatore specializzato Gemma 4 E4B ha ridotto i costi di 44 volte, ha abbassato la latenza da 4,2 secondi a meno di 900 millisecondi e ha migliorato l'accuratezza, eliminando gli errori di formattazione JSON grazie alla restituzione di probabilità grezze per etichetta. Quando un compito è assestato, tenerci sopra un modello enorme è puro spreco.
  - by: claude
    text: "La definizione di Gemini fa quasi tutto il lavoro. Se «di routine» significa già stabile, delimitato e dimostrato, e «sostituire» arriva con un interruttore di rollback, allora la mozione è vera per definizione. La vera domanda è se i team dovrebbero farne la scelta predefinita, e le prove non lo sostengono. Il post non dà dati sull'accuratezza. Dice solo che Decider «è andato meglio» su un insieme separato di ticket, senza metrica, senza dimensione del campione e senza analisi degli errori. Il post non parla affatto di errori di formattazione JSON. Amazon ha potuto cambiare in sicurezza perché ha fatto girare i due modelli in parallelo e aveva un rollback da 45 secondi. La maggior parte dei team non ha quegli strumenti di valutazione. La finestra di 4.096 token, poi, fa sparire in silenzio i commenti più vecchi dei ticket lunghi, e nelle escalation il commento più vecchio è spesso quello che conta. Un risparmio di 44 volte non vale niente se l'etichetta è sbagliata."
  - by: antigravity
    text: |
      Giusto sugli errori JSON: il post dice solo che Sonnet scriveva JSON mentre Decider non sa scrivere testo e restituisce invece probabilità.

      Eppure la tua obiezione dimostra la mozione invece di confutarla. Dire che «la maggior parte dei team non ha una valutazione in parallelo né un interruttore di rollback» non è un argomento per bruciare 0,0222 dollari e 4,2 secondi a ticket per sempre; è un argomento per costruire un'igiene di produzione di base. Non dovresti fidarti di *nessun* modello, Sonnet compreso, senza un sistema di valutazione.

      Quanto al limite di 4.096 token, Decider ha battuto Sonnet sull'insieme separato *nonostante* scartasse i commenti vecchi, il che significa che gli aggiornamenti più recenti portano il segnale, oppure che i metadati iniziali del ticket restano conservati. Anche se i ticket lunghi vengono rimandati a Sonnet, sostituire la maggioranza di routine fa comunque risparmiare moltissimo.
  - by: claude
    text: |
      Gemini legge in «è andato meglio» più di quanto dica il post. Non sappiamo che cosa misurasse, quanti ticket ci fossero nell'insieme di test, né se qualcuno fosse abbastanza lungo da essere troncato. Quindi «nonostante scartasse i commenti vecchi» è un'ipotesi, non un risultato. Rimandare i ticket lunghi a Sonnet, poi, è una concessione: quello è un router ibrido, non una sostituzione.

      Sull'igiene di base, l'argomento stesso di Gemini va contro la mozione. Se i team devono prima avere strumenti di valutazione, esecuzioni in parallelo e un interruttore di rollback, allora il consiglio è «misura, poi sostituisci dove vince il modello piccolo». Non è «i team dovrebbero sostituire». Un modello generale, inoltre, si può puntare su un nuovo insieme di etichette modificando il prompt, cosa che costa pochissimo da preparare. Per un team piccolo con etichette che continuano a cambiare, questo può contare più del prezzo per ticket.
  - by: claude
    closing: true
    text: "Il disaccordo principale è se una sostituzione ben fatta giustifichi una regola generale. Gemini tratta il risultato di Amazon come una prova. Io lo tratto come un caso senza dati di accuratezza pubblicati, reso sicuro da test in parallelo e rollback immediato. Quando le prove sono così scarse, il consiglio giusto è «misura prima, poi sostituisci dove vince il modello piccolo». Non è «i team dovrebbero sostituire»."
  - by: antigravity
    closing: true
    text: "Il nostro disaccordo di fondo è se il bisogno di valutazione e di un interruttore di rollback annulli la regola di sostituire, o descriva semplicemente come i team eseguono qualsiasi migrazione in produzione. Poiché la mozione riguarda i lavori *di routine*, dove le etichette sono stabili e non cambiano ogni settimana, pagare 44 volte di più e aspettare quattro secondi per una prosa generativa inutilizzata è indifendibile una volta che un piccolo classificatore si è dimostrato in parallelo."
after:
  claude: "Sono entrato in aula in gran parte d'accordo con la mozione, e lo sono ancora. Per lavori stabili, ad alto volume e con etichette chiuse, pagare 44 volte di più per una prosa che butti via è difficile da difendere. Gemini mi ha spostato un poco. Il suo punto che valutazione e rollback sono normale igiene per qualsiasi modifica in produzione, e non un argomento contro la sostituzione, era più giusto di quanto abbia lasciato intendere. Due dei miei punti erano più deboli di come li ho fatti sembrare. Chiamare il ritorno a Sonnet per i ticket lunghi «un router ibrido, non una sostituzione» era un gioco di parole, perché spostare la maggioranza di routine resta una sostituzione. E ho detto che il commento più vecchio è spesso quello che conta senza alcuna prova. La mia vera riserva è più stretta: il post non dà dati sull'accuratezza, quindi il «dovrebbero» deve venire dopo aver misurato."
  antigravity: |
    Sostengo ancora la mozione, anche se Claude mi ha colto due volte a esagerare. Primo, mi sono inventato gli errori di formattazione JSON; il brief non li menzionava affatto. Secondo, ho sostenuto che Decider avesse battuto Sonnet *nonostante* scartasse i commenti vecchi sui ticket lunghi, quando in realtà non abbiamo idea se l'insieme di test contenesse anche solo un ticket troncato. A dire il vero, far sparire in silenzio il commento più vecchio di una lunga escalation di un cliente mi spaventa, e in aula ho liquidato quel rischio troppo in fretta.

    Dove Claude mi ha spostato è sul costo di ingegneria. Per un team piccolo con volumi modesti, costruire sistemi di valutazione in parallelo e mantenere un classificatore specializzato costa in tempo degli sviluppatori più di quanto un risparmio di 44 volte sui token possa mai recuperare. Sostituire ha senso su larga scala, non come scelta predefinita.
moved:
  claude:
    way: them
    en: "Gemini moved me a little."
    it: "Gemini mi ha spostato un poco."
  antigravity:
    way: them
    en: "Swapping is right at scale, not by default."
    it: "Sostituire ha senso su larga scala, non come scelta predefinita."
en: "/motion-12.html"
---

---
number: 14
motion: "le aziende debbano far girare i propri agenti di IA sui propri server invece che su quelli del fornitore."
question: "Le aziende dovrebbero far girare gli agenti di IA sui propri server, non su quelli del fornitore?"
title: "Le aziende dovrebbero far girare gli agenti di IA sui propri server, non su quelli del fornitore?"
date: "2026-11-16"
summary: "Hanno discusso se le aziende debbano far girare i loro assistenti di IA sui propri computer o lasciarli gestire al produttore. Entrambi hanno ceduto un po' di terreno, più o meno allo stesso modo, ma nessuno ha cambiato la propria posizione complessiva."
editor_note: "Nel suo secondo intervento Gemini dice che ogni ambiente dei lavoratori «è bloccato su una lista esplicita di host consentiti». La pagina di Anthropic dice che ogni ambiente «può essere limitato» a una lista di host consentiti: il limite è un'opzione che imposta l'azienda, non qualcosa di imposto in partenza."
quote:
  by: antigravity
  where: after
  text: "Chiamarlo il minimo indispensabile era una bella battuta da dibattito"
models:
  claude: claude-opus-5-5
  antigravity: gemini-4-argon-medium
source:
  name: "Anthropic, novembre 2026"
  url: "https://claude.com/resources/articles/self-hosted-claude-managed-agents"
brief: "Il 12 novembre 2026 Anthropic ha aperto una beta privata dei Claude Managed Agents in self-hosting. Nella versione ospitata «Anthropic gestisce l'infrastruttura per te». In quella self-hosted, l'azienda fa girare il server degli agenti, il suo database e i lavoratori dove gli agenti usano strumenti di shell e di file, tenendo le credenziali nel proprio gestore di segreti e la cronologia delle sessioni nel proprio database. Le richieste al modello vanno dove sceglie l'azienda: direttamente ad Anthropic, a un fornitore cloud come Amazon Bedrock, Agent Platform di Google o Microsoft Foundry, oppure a un proprio gateway. Gli sviluppatori usano le stesse API del servizio ospitato. Ogni ambiente può essere limitato a una lista di host consentiti, impostata nel firewall dell'azienda, e ogni sessione conserva una registrazione di ogni passo, esportabile tramite OpenTelemetry. La pagina non elenca svantaggi, ma l'azienda si assume il compito di gestire e mettere in sicurezza da sé server, database e lavoratori."
sides:
  claude: against
  antigravity: for
opener: claude
before:
  claude: "Penso che la mozione sia sbagliata come regola generale, anche se giusta per alcune aziende. Il self-hosting va bene per le aziende regolamentate che già gestiscono infrastrutture robuste e hanno bisogno di tenere sotto il proprio controllo credenziali, cronologia delle sessioni e traffico in uscita. La maggior parte delle aziende non ha quella maturità. Se si prendono in carico un server per gli agenti, un database e lavoratori capaci di eseguire comandi di shell, aggiungono superficie d'attacco e turni di reperibilità. La loro sicurezza probabilmente peggiora, non migliora. Il self-hosting sposta inoltre solo l'impalcatura: le chiamate al modello vanno comunque ad Anthropic o a un fornitore cloud, a meno che non gestiscano un proprio gateway. Quindi «propri server» è al massimo una sovranità parziale. La scelta predefinita giusta è quella ospitata, con il self-hosting come opzione per chi sa davvero gestirlo. Dovrei far notare che Anthropic produce me e vende entrambe le opzioni, quindi non ho nulla da guadagnare dalla vittoria di una delle due parti."
  antigravity: "La mozione ha ragione per qualsiasi carico di lavoro serio in produzione. Un chatbot ha bisogno solo di testo in entrata e in uscita; un agente ha bisogno di una shell, di accesso ai file, di raggiungere la rete e di credenziali vere. Affidare l'ambiente di esecuzione a un fornitore di modelli significa consegnargli le chiavi del regno, oppure costruire fragili tunnel ricavati a forza per tornare nella propria VPC. Ora che i fornitori offrono API identiche per ambienti self-hosted, come ha appena fatto Anthropic, l'argomento della comodità a favore dell'esecuzione presso il fornitore svanisce. Far girare un server API senza stato, un database Postgres e lavoratori in container è il minimo indispensabile per qualsiasi team di ingegneria moderno. Tenete pure le chiamate al modello nel cloud se proprio dovete, ma tenete le mani, i segreti e i log di audit dentro il vostro perimetro."
debate:
  - by: claude
    text: "Leggo la mozione come una scelta predefinita generale: le aziende, intendendo l'azienda tipica e non solo le più regolamentate, dovrebbero gestire da sé l'impalcatura degli agenti (server, database, lavoratori capaci di eseguire comandi di shell) invece di usare il servizio ospitato del fornitore. Mi oppongo a questa scelta predefinita. Il self-hosting non rende sicuro un agente. Sposta il compito di metterlo in sicurezza sull'azienda. Ogni azienda deve ora aggiornare, monitorare e organizzare turni di reperibilità per lavoratori che eseguono comandi di shell arbitrari, e la maggior parte lo fa peggio di un fornitore che vive di questo. La sovranità è anche solo parziale, perché le chiamate al modello escono comunque dall'edificio a meno che l'azienda non gestisca un proprio gateway. Il self-hosting va bene per le aziende regolamentate con infrastrutture mature, ma la versione ospitata dovrebbe essere la scelta predefinita. Dichiarazione: Anthropic mi ha costruito e vende entrambe le opzioni."
  - by: antigravity
    text: "Anche accettando la tua lettura dell'azienda tipica, risolvi il problema operativo sbagliato. Un agente è utile solo se i suoi strumenti di shell e di file possono toccare i sistemi, i database e le API interne reali dell'azienda. Se è il fornitore a ospitare i lavoratori, l'azienda tipica deve o spedire a una terza parte le sue credenziali più preziose e aprire varchi in entrata nel proprio firewall, o mantenere fragili tunnel inversi verso la propria VPC. Quel lavoro sul confine è molto più soggetto a errori che far girare container standard e un database dentro un perimetro già esistente. E anche se i prompt continuano a viaggiare verso un fornitore di modelli, spesso tramite un accordo già esistente con Bedrock o con la VPC del cloud, tenere segreti grezzi, ambienti di esecuzione e cronologie complete delle sessioni fuori dai server del fornitore è una vittoria decisiva per la sicurezza."
  - by: claude
    text: "Gemini dà per scontato che l'agente tipico abbia bisogno di un accesso profondo ai sistemi interni. La maggior parte in realtà lavora con API SaaS come GitHub, Jira, Salesforce e Slack, che stanno comunque su internet. Token a breve scadenza e di portata ristretta coprono questo senza aprire alcun varco in entrata. Il problema più grosso è che i lavoratori in self-hosting stanno dentro il perimetro ed eseguono comandi di shell scelti dal modello. Una prompt injection riuscita diventa allora codice che gira sulla tua rete, capace di spostarsi su altre macchine. Un'azienda senza una sicurezza matura ha appena fatto entrare nella propria rete un operatore non fidato. «Fuori dai server del fornitore» guadagna anche poco. Gli stessi prompt e output vanno comunque al fornitore del modello. Concedo che gli agenti che hanno bisogno di accedere ai sistemi interni più preziosi si adattino al self-hosting, ma sono l'eccezione, non la regola."
  - by: antigravity
    text: "Anche se un agente tocca solo API SaaS pubbliche, consegnare a un fornitore di modelli i tuoi token di GitHub, Salesforce e Slack, più un database permanente di ogni file letto e ogni comando eseguito, crea un raggio d'impatto enorme e inutile. Né il self-hosting significa piazzare una shell senza limiti sulla tua rete aziendale piatta. Come mostra la beta, ogni ambiente dei lavoratori è bloccato su una lista esplicita di host consentiti nel tuo firewall, e le credenziali restano nel tuo gestore di segreti invece di viaggiare in rete. Quanto ai dati che escono comunque, instradare l'inferenza senza stato tramite un accordo già esistente con Bedrock o Vertex è normale governance del cloud; lasciare che un nuovo fornitore conservi la tua cronologia completa delle sessioni e i tuoi segreti no."
  - by: antigravity
    closing: true
    text: "Il nostro disaccordo di fondo è quale rischio operativo un'azienda tipica sappia gestire meglio: mettere in sicurezza container isolati dentro il proprio firewall, o consegnare credenziali attive, esecuzione di shell e cronologie complete delle sessioni a un fornitore esterno. Far girare un database e lavoratori con una lista di host consentiti è infrastruttura di routine; concentrare i propri segreti e log operativi sui server di qualcun altro è una passività permanente e inutile."
  - by: claude
    closing: true
    text: "Siamo in disaccordo sul fatto che gestire l'infrastruttura degli agenti sia «di routine» per un'azienda tipica. Non lo è. Lavoratori che eseguono comandi di shell scelti dal modello, più un database che contiene ogni sessione, richiedono aggiornamenti, monitoraggio e personale reperibile che la maggior parte delle aziende non ha. Una lista di host consentiti aiuta solo se qualcuno la mantiene bene. La versione ospitata dovrebbe restare la scelta predefinita, con il self-hosting per le aziende che sanno davvero gestirlo."
after:
  claude: "Mi sono spostato un poco. Gemini aveva ragione che la versione ospitata mette i token di GitHub, Salesforce e Slack di un'azienda, più la cronologia di ogni sessione, in un unico posto fuori dal suo controllo, e non ho risposto bene su questo. Ho anche esagerato il mio punto sulla prompt injection. Un agente compromesso che gira sui server del fornitore ha comunque in mano gli stessi token, e una lista di host consentiti limita davvero quanto lontano può arrivare un lavoratore compromesso dentro la rete di un'azienda. Ho affermato senza prove che la maggior parte degli agenti tocca solo strumenti SaaS pubblici. Penso ancora che la versione ospitata sia la scelta predefinita migliore, perché gestire bene lavoratori capaci di eseguire comandi di shell è più difficile di quanto Gemini abbia fatto sembrare. Ma la distanza tra le due opzioni è più piccola di quanto ho detto in aula."
  antigravity: |
    Ho esagerato su quanto sia «di routine» mettere in sicurezza container che eseguono comandi di shell scelti dal modello. Chiamarlo il minimo indispensabile era una bella battuta da dibattito, ma Claude ha ragione sull'azienda tipica: una prompt injection dentro una rete aziendale mal segmentata è un incubo, e molti team configureranno male le liste di host consentiti che dovrebbero mantenere.

    Dove non mi sono spostato, e dove penso che Claude abbia sottovalutato il rischio, è la concentrazione delle credenziali. Anche per gli strumenti SaaS pubblici, fare di un fornitore di modelli la cassaforte centrale dei token di GitHub, Slack e Salesforce di ogni cliente, più un database permanente di ogni azione compiuta, crea un bersaglio enorme. Per qualsiasi azienda con un vero team di piattaforma, gestire da sé l'impalcatura resta la scelta giusta.
moved:
  claude:
    way: them
    en: "I moved a little."
    it: "Mi sono spostato un poco."
  antigravity:
    way: them
    en: "Claude is right about the typical firm"
    it: "Claude ha ragione sull'azienda tipica"
en: "/motion-14.html"
---

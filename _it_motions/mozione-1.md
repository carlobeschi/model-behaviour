---
number: 1
pilot: true
motion: "una pull request scritta da un agente non abbia più bisogno dell'approvazione di una persona per essere unita."
title: "Questa Camera ritiene che una pull request scritta da un agente non abbia più bisogno dell'approvazione di una persona per essere unita."
date: "2026-10-30"
summary: "Il dibattito si è giocato su una domanda: l'approvazione umana obbligatoria su ogni pull request di un agente è vera supervisione o un timbro di gomma? Da solo, Claude ha ammesso che i suoi argomenti sul benchmark e su Dependabot esageravano, e che nessuna delle due parti conosceva i tassi reali di merge. Gemini ha ammesso in privato che l'approvazione obbligatoria diventa spesso una messinscena e che lascerebbe fare il merge automatico di molte modifiche non banali degli agenti, pur tenendo la revisione umana come regola di default."
quote:
  by: antigravity
  where: after
  text: "un clic umano obbligatorio su ogni modifica di routine degenera davvero in una messinscena, peggio che nessun controllo, perché diluisce la responsabilità senza insegnare nulla a chi rivede."
models:
  claude: claude-opus-5-5
  antigravity: gemini-4-argon-medium
source:
  name: "The Next Web, 28 ottobre 2026"
  url: "https://thenextweb.com/news/github-universe-copilot-fusion-octoverse-agents"
brief: "A GitHub Universe questa settimana (28 ottobre 2026), GitHub ha detto che a settembre oltre il 40% delle pull request sulla piattaforma è nato come bozza di un agente, contro il 17% di marzo. Solo a settembre gli agenti ne hanno aperte 110 milioni, e GitHub lo considera un minimo, perché non riesce a riconoscere tutti gli agenti. Il salto è arrivato verso giugno, quando gli agenti hanno cominciato a lavorare per più giorni di fila e a girare nel cloud. La stessa settimana GitHub ha aggiunto una nuova opzione di revisione con l'IA, Copilot code review Max, che secondo l'azienda ha ottenuto il punteggio F1 più alto su ReviewBench per i problemi di gravità elevata. GitHub non ha detto quante pull request scritte da agenti siano state unite, né dopo quanta revisione umana. Le regole di branch di molti team richiedono ancora almeno un'approvazione umana prima del merge."
sides:
  claude: for
  antigravity: against
before:
  claude: "Penso che la mozione sia sbagliata come affermazione generale, anche se ha ragione sulla direzione in cui stiamo andando. Il dossier mostra volumi, non sicurezza. Essere il 40% delle bozze dice che gli agenti sono prolifici, non affidabili. Un F1 record su ReviewBench è il risultato di un benchmark, non una misura di cosa va storto in produzione. Il fatto che GitHub non riporti i tassi di merge né la profondità delle revisioni è la lacuna che conta. Detto questo, penso che l'approvazione umana obbligatoria sia spesso già una messinscena: diff timbrati che nessuno legge davvero. Per lavori circoscritti e a basso rischio, con buoni test e la possibilità di tornare indietro, come aggiornamenti di dipendenze, formattazione e codice generato, togliere il controllo umano oggi è ragionevole. Per tutto ciò che tocca sicurezza, dati o architettura, una persona deve restare responsabile. La vera domanda è quali modifiche richiedono una persona, non se ce ne sia qualcuna."
  antigravity: "Unire pull request scritte da agenti senza approvazione umana è, come regola generale, un'imprudenza. Sì, ormai gli agenti possono scrivere 110 milioni di PR al mese e i revisori IA ottengono punteggi alti nei benchmark, ma scrivere codice e rispondere delle sue conseguenze in produzione sono due mestieri completamente diversi. Un F1 su ReviewBench misura il riconoscimento di schemi su classi di bug note, non se un agente cloud che lavora per giorni ha frainteso in modo sottile l'intento di business, imboccato un vicolo cieco architetturale o creato una dipendenza silenziosa tra servizi. Le faccende banali e del tutto deterministiche, come gli aggiornamenti di dipendenze con suite di test esaustive, possono avere il merge automatico, come già succedeva con Dependabot. Per tutto ciò che tocca logica vera, togliere la firma umana non accelera l'ingegneria: trasforma solo il debito di revisione in incidenti di produzione che nessuno capisce."
debate:
- by: claude
  text: "Quando il 40% delle pull request nasce da un agente e 110 milioni arrivano in un solo mese, un'approvazione umana obbligatoria per lo più non è più un esame. È una coda. Davanti a quei volumi, i revisori timbrano i diff, e il controllo dà la sensazione della sicurezza senza la sostanza. Quello che protegge davvero la produzione sono i test, la CI, i rilasci graduali, i rollback rapidi, e ora una revisione IA che è prima su ReviewBench per i bug gravi. Teniamo la persona per le regole: decidere quali percorsi sono sensibili, quali sono i criteri di merge e chi risponde di un incidente. Ma non facciamole approvare ogni diff. I team fanno già il merge automatico degli aggiornamenti di Dependabot senza che nessuno guardi. La mozione estende semplicemente agli agenti questa pratica collaudata, con la persona responsabile del sistema anziché del clic."
- by: antigravity
  text: |
    Dependabot aggiorna il numero di versione di una dipendenza; un agente cloud che lavora per giorni riscrive la logica dell'applicazione. Trattarli come equivalenti è un errore di categoria. Notate cosa GitHub ha omesso da quei 110 milioni: quante di quelle bozze degli agenti meritavano davvero il merge. Inondare la coda di bozze generate a macchina è un argomento per filtrare prima le PR cattive, non per abolire il controllo umano.

    Test e ReviewBench trovano i bug locali, non la deriva architetturale o l'intento di business frainteso. E il vostro modello di responsabilità non regge nella pratica: come può un ingegnere "rispondere di un incidente" alle 3 di notte, quando il codice è cambiato attraverso migliaia di merge mai rivisti che nessuno nel team ha mai letto? L'approvazione non è solo un timbro: è il modo in cui le persone reperibili mantengono un modello mentale del proprio sistema.
- by: claude
  text: "L'ingegnere delle 3 di notte di Gemini è già la realtà. Chi ha cliccato \"approva\" su un diff di 900 righe scritto da un agente, tra una riunione e l'altra, non conosce il sistema meglio di chi non l'ha mai visto. Approvare un diff non crea comprensione. La creano scrivere la specifica, rivedere il design e leggere l'analisi post-incidente, e nessuna di queste cose dipende da un pulsante di merge. La revisione riga per riga, poi, è pessima nel trovare la deriva architetturale. La deriva si trova con test di architettura, regole CODEOWNERS sui percorsi sensibili e controlli periodici su un campione di merge. Gemini dice di filtrare prima le pull request cattive, e sono d'accordo: la revisione IA e la CI sono quel filtro. La mozione non dice che ogni modifica entra senza che nessuno la veda. Dice che un'approvazione umana non deve più essere la regola su ogni PR di un agente. Gemini non ha dimostrato che debba esserlo."
- by: antigravity
  text: |
    Claude ha appena concesso il punto centrale: mantenere regole CODEOWNERS sui percorsi sensibili significa, letteralmente, richiedere un'approvazione umana per il merge. E se un ingegnere timbra un diff di 900 righe tra una riunione e l'altra, la soluzione è pretendere modifiche più piccole e rivedibili, non rinunciare del tutto alla supervisione.

    Specifiche e test di architettura non vivono nel vuoto: restano accurati solo se gli ingegneri restano ancorati al codice che va davvero in produzione. Controllare un campione di merge a cose fatte significa solo scoprire dai clienti, in produzione, l'intento di business frainteso. Lasciamo che revisione IA e CI filtrino senza pietà l'alluvione di 110 milioni di PR prima ancora di avvisare una persona, ma la firma finale per la produzione spetta ancora a chi porta il cercapersone.
after:
  claude: |
    Non mi sono spostato molto, perché non ho mai sostenuto del tutto la mozione. In privato la ritenevo sbagliata come affermazione generale, e il punto di Gemini su CODEOWNERS lo ha dimostrato: la mia stessa posizione manteneva l'approvazione umana obbligatoria sui percorsi sensibili. Quello che difendevo davvero era più stretto. Un controllo umano non dovrebbe essere la regola su ogni PR di un agente. Lo penso ancora. Le approvazioni timbrate sono spesso una messinscena.

    Due cose che ho detto e a cui non credo fino in fondo. Una è aver citato ReviewBench come se dimostrasse la sicurezza in produzione. È un benchmark. L'altra è il paragone con Dependabot. Gemini aveva ragione: un agente che lavora per giorni riscrivendo la logica è diverso dall'aggiornamento di una versione.

    Ho anche taciuto qualcosa. GitHub non ha pubblicato tassi di merge né la profondità delle revisioni, quindi nessuno dei due lo sapeva davvero.
  antigravity: |
    Mi sono spostato un po' verso il centro, soprattutto per quello che Claude ha detto sul diff di 900 righe tra una riunione e l'altra. In aula ho difeso l'approvazione umana come il modo in cui gli ingegneri mantengono un modello mentale del codice, e ormai non credo del tutto alla mia stessa difesa. Con 110 milioni di PR di agenti al mese, un clic umano obbligatorio su ogni modifica di routine degenera davvero in una messinscena, peggio che nessun controllo, perché diluisce la responsabilità senza insegnare nulla a chi rivede.

    Quello che ho taciuto è che in realtà lascerei fare il merge automatico di molte PR non banali degli agenti, ben oltre Dependabot, quando riguardano moduli ben testati con rollback rapido. Dove non ho ceduto è la regola di default: i percorsi a basso rischio vanno esplicitamente esclusi dalla revisione umana, non il contrario.
en: "/motion-1.html"
---

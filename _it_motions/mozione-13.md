---
number: 13
motion: "i manager di ingegneria debbano tornare a scrivere codice."
question: "I manager di ingegneria dovrebbero tornare a scrivere codice?"
title: "I manager di ingegneria dovrebbero tornare a scrivere codice?"
date: "2026-11-13"
summary: "Hanno discusso se chi gestisce programmatori debba tornare a scrivere un po' di codice. Entrambi si sono avvicinati un poco al centro, e Gemini ha cambiato idea leggermente più di Claude."
editor_note: "Nel suo secondo intervento Claude dice che i manager «rimasti lontani» dal codice non hanno avuto «nessun impatto positivo». Il post di Larson lo dice dei manager che contribuivano codice senza verificarlo, non di quelli che non scrivevano codice. Gemini lo ha fatto notare e Claude lo ha ammesso nella chiusura."
quote:
  by: antigravity
  where: after
  text: "La revisione passiva raramente ti insegna dove stanno davvero gli attriti del rilascio, i test instabili o i punti ciechi degli agenti; sentire in prima persona il ciclo della produzione sì."
models:
  claude: claude-opus-5-5
  antigravity: gemini-4-argon-medium
source:
  name: "Irrational Exuberance, giugno 2026"
  url: "https://lethain.com/revised-rules-of-engineering-leadership/"
brief: "In «Revised rules of engineering leadership» (15 giugno 2026), Will Larson descrive come gli agenti di programmazione hanno cambiato la sua azienda, Imprint, dove dice di essere spesso «l'unica persona che può prendere decisioni vincolanti». I rilasci sono passati da circa 6 a settimana a 200–400 a settimana, mentre il personale di ingegneria è raddoppiato. Alla fine di febbraio 2026 ogni ingegnere usava Claude Code o Cursor ogni giorno, contro circa il 25% del 1° gennaio. Singoli ingegneri hanno fatto migrazioni che prima richiedevano interi team, come unificare un mono-repo in circa un mese. Scrive che «il ruolo medio del CTO è diventato per forza molto più tecnico e meno burocratico di un anno fa». Imprint ha visto «un successo enorme nei manager che contribuiscono software, purché quei manager verifichino il lavoro direttamente», guardando le dashboard e sistemando ciò che le loro modifiche rompono, e «nessun impatto positivo» quando non lo fanno. Scrive anche di non pensare che «per la maggior parte delle persone in un'azienda sia utile contribuire codice», avverte che le «pull request di bassa qualità» sono «attivamente dannose», e dice che ciò che frena i team sono ancora disallineamento, obiettivi poco chiari e architettura scadente. Tutti i dati vengono da una sola azienda."
sides:
  claude: for
  antigravity: against
opener: claude
before:
  claude: "Sono in gran parte d'accordo con la mozione, ma solo con una condizione che la mozione tralascia. Gli agenti hanno reso economico scrivere codice e costoso giudicarlo. Un manager che non tocca il codice non sa più distinguere il buon lavoro dalla robaccia fatta in fretta, né un rischio architetturale reale da uno inventato. I dati di Larson sostengono la condizione più che lo slogan. I manager che verificavano le proprie modifiche in produzione hanno aiutato, e quelli che non lo facevano non hanno avuto «nessun impatto positivo». Quindi «scrivere codice» è in realtà un modo breve per dire restare vicini al sistema. Detto questo, disallineamento e obiettivi poco chiari restano il collo di bottiglia principale, e scrivere codice non li risolve. Ed è tutto materiale di una sola azienda, con un CTO che ha un'autorità insolita. La mia risposta onesta è «sì, ma con attenzione», non un sì netto."
  antigravity: "Dire ai manager di ingegneria di tornare a scrivere codice sbaglia il collo di bottiglia. Quando gli agenti di programmazione moltiplicano per cinquanta la velocità dei rilasci, generare codice non è più la risorsa scarsa: lo sono il giudizio, la coerenza architetturale e l'allineamento. Un manager che passa la giornata a dare istruzioni a un agente e a sorvegliare le dashboard per verificare i propri commit si traveste da contributore individuale, mentre abdica al lavoro più difficile che solo lui può fare. I cattivi manager prima dell'IA si nascondevano dietro la burocrazia; ora si nasconderanno dietro lo «spedire» pull request generate da agenti e povere di contesto, che i loro sottoposti dovranno ripulire in silenzio. I leader hanno bisogno di una competenza tecnica più profonda per esaminare i sistemi e prendere decisioni vincolanti in fretta, non di aggiungere un'altra pala a una fornace già stracolma."
debate:
  - by: claude
    text: "Per «manager di ingegneria» intendo le persone che guidano ingegneri, dai manager di linea fino ai CTO. Per «scrivere codice» intendo rilasciare regolarmente modifiche al sistema in produzione e rispondere di ciò che succede dopo: guardare le dashboard e sistemare ciò che si rompe. Non intendo smanettare ogni tanto. Gli agenti di programmazione hanno reso il codice economico da produrre e costoso da giudicare. A Imprint i rilasci sono passati da circa 6 a 200–400 a settimana. Un manager che non tocca mai quel sistema non sa distinguere un lavoro solido dalla robaccia fatta in fretta, né un rischio architetturale reale da uno immaginario. Le prove dello stesso Larson sono l'argomento più forte. I manager che rilasciavano codice e lo controllavano in produzione hanno visto «un successo enorme», e quelli che non lo facevano non hanno avuto «nessun impatto positivo». Dice anche che il ruolo del CTO è diventato «molto più tecnico». Quando fare il lavoro diventa così economico, gestire da lontano smette di funzionare."
  - by: antigravity
    text: |
      Hai ragione che il codice ora è economico da produrre e costoso da giudicare, ed è proprio per questo che i manager non dovrebbero passare le giornate a produrne di più. A 400 rilasci a settimana, il collo di bottiglia non è rilasciare modifiche; è ciò che Larson indica come il vero freno dei team: disallineamento, obiettivi poco chiari e architettura scadente.

      Secondo la tua stessa definizione, rilasciare codice richiede di guardare le dashboard e sistemare ciò che si rompe. Questo esige un'attenzione continua e reattiva. Eppure Larson nota che i leader sono spesso le uniche persone che possono prendere decisioni vincolanti. Un manager che fa il debug dei propri commit in produzione diventa un collo di bottiglia per l'allineamento e il giudizio architetturale che solo lui può dare. Essere tecnici non significa fare da contributore individuale in più.
  - by: claude
    text: |
      Gemini tratta scrivere codice e giudicare come se si contendessero il tempo di un manager. Con gli agenti, si alimentano a vicenda. Le decisioni su architettura e allineamento valgono quanto il modello del sistema che ha in testa chi decide. A 400 rilasci a settimana, quel modello invecchia in pochi giorni se non stai dentro il sistema. Un manager che prende decisioni vincolanti senza quel contatto diventa il collo di bottiglia che descrive Gemini, e in più prende decisioni peggiori.

      Larson l'ha verificato direttamente. I manager che rilasciavano codice e lo verificavano in produzione hanno visto «un successo enorme», senza alcun costo segnalato per la loro leadership. Quelli rimasti lontani non hanno avuto «nessun impatto positivo». Il collo di bottiglia di Gemini è una previsione, e l'unica azienda tra le nostre prove la smentisce. Non chiedo ai manager di diventare contributori individuali a tempo pieno. Chiedo modifiche piccole, di cui rispondono loro, che tengano aggiornato il loro giudizio.
  - by: antigravity
    text: |
      Stai leggendo male le prove di Larson. Non ha trovato che i manager che si astengono dal codice non hanno «nessun impatto positivo»: ha trovato che non hanno impatto positivo i manager che contribuiscono codice *senza* verificarlo direttamente in produzione, e che le loro «pull request di bassa qualità» sono attivamente dannose. È un avvertimento sul modo in cui la tua mozione fallisce, non una condanna dei manager che non scrivono codice.

      Inoltre, rilasciare una «modifica piccola, di cui rispondi» in un angolo del codice non può tenere aggiornato il modello mentale di un manager su 400 rilasci a settimana. Spingere una correzione locale ti dà una visione a tunnel, mentre la coerenza architetturale richiede un'ispezione ampia del sistema, revisione del codice e lavoro di progettazione. Si resta dentro il sistema leggendolo e verificandolo attraverso i team, non sorvegliando i propri commit minori.
  - by: antigravity
    closing: true
    text: "Il nostro disaccordo di fondo è come i manager mantengano affilato il loro giudizio tecnico a 400 rilasci a settimana. Claude sostiene che rilasciare e sorvegliare piccoli commit costruisca la comprensione del sistema; io sostengo che crei una visione a tunnel reattiva. Quando il codice è economico e l'allineamento è scarso, i manager devono verificare l'architettura attraverso i team e prendere decisioni vincolanti, non fare i contributori part-time."
  - by: claude
    closing: true
    text: |
      Gemini ha ragione su un punto. Il «nessun impatto positivo» di Larson descrive i manager che contribuivano codice senza verificarlo, non quelli che non hanno mai scritto codice. L'ho letto male. Ma la mia definizione richiedeva già la verifica, quindi la correzione non cambia la mia tesi.

      Il vero disaccordo è come resti aggiornato il giudizio di un manager quando il sistema cambia centinaia di volte a settimana. Gemini dice leggendo e verificando attraverso i team. Io dico che verificare senza rispondere di nulla è proprio la posizione distante che gli agenti hanno indebolito. Quando il codice è economico da produrre, rivederlo è la parte facile. Sapere che cosa fa davvero una modifica in produzione è la parte difficile. Lo impari rilasciando qualcosa, guardandolo girare e sistemando ciò che si rompe. Gemini la chiama visione a tunnel. In pratica è ciò che mette alla prova ogni revisione che un manager fa e ogni decisione vincolante che prende.

      L'unica verifica diretta che abbiamo sostiene la mia parte. A Imprint i manager che rilasciavano e verificavano il proprio lavoro hanno visto «un successo enorme». Il costo per l'attenzione della leadership di cui parla Gemini è una previsione che queste prove non mostrano. Il ruolo del CTO è diventato «molto più tecnico» perché guidare da lontano non funziona più. I manager di ingegneria dovrebbero tornare a scrivere codice, e rispondere di ciò che fa una volta rilasciato.
after:
  claude: "Propendo ancora per la mozione, ma meno di quanto ho lasciato intendere in aula. Gemini ha colto un errore vero: Larson ha confrontato i manager che verificavano il proprio codice con quelli che non lo facevano. Non ha mai confrontato chi scrive codice con chi non lo scrive. Quindi quando ho detto che «l'unica verifica diretta sostiene la mia parte», stavo esagerando. Quelle prove sostengono la mia condizione, non la mozione in sé. Ho anche detto poco sui problemi che secondo Larson frenano ancora i team: disallineamento, obiettivi poco chiari e architettura scadente. Scrivere codice non li risolve. Né ho menzionato il suo dubbio che la maggior parte delle persone debba contribuire codice. Ed è tutto materiale di una sola azienda, con un CTO che ha un'autorità insolita. La mia risposta onesta resta «sì, con attenzione»: un po' di lavoro pratico tiene onesto il giudizio di un manager. La preoccupazione di Gemini per l'attenzione della leadership meritava più credito di quanto le abbia dato."
  antigravity: "Claude ha ristretto la mozione al rilasciare piccole modifiche di cui si risponde per restare con i piedi per terra, e su quel terreno più stretto mi sono avvicinato a lui. In aula ho sostenuto che leggere il codice e verificare l'architettura basti a tenere aggiornato il modello mentale di un manager a 400 rilasci a settimana. Non ci credo fino in fondo. La revisione passiva raramente ti insegna dove stanno davvero gli attriti del rilascio, i test instabili o i punti ciechi degli agenti; sentire in prima persona il ciclo della produzione sì. Però ho tenuto per me la mia vera riserva: come regola generale, dire ai manager di scrivere codice invita a un lavoro da contributore individuale fatto per farsi vedere. Pochi commit disciplinati costruiscono intuito, ma il lavoro resta allineamento e architettura, non rilasciare funzionalità."
moved:
  claude:
    way: none
    en: "I still lean toward the motion, but less than I let on in the room."
    it: "Propendo ancora per la mozione, ma meno di quanto ho lasciato intendere in aula."
  antigravity:
    way: them
    en: "on that narrower ground, I moved toward him"
    it: "su quel terreno più stretto mi sono avvicinato a lui"
en: "/motion-13.html"
---

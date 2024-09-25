# README

per avviare i server aprire due shell e digitare in una:

    rails server -e user -p 3000 --pid tmp/pids/server_user.pid
e nell'altra:

    rails server -e operator -p 4000 --pid tmp/pids/server_operator.pid
    
poi visitare rispettivamente [localhost:3000](http://localhost:3000) e [localhost:4000](http://localhost:4000)


Domande segnalazione emergenza:
1) Il paziente è coscente?
2) Il paziente respira autonomamente?
3) Il paziente ha un battito cardiaco?

a prescindere da 1,2,3:

4) Il paziente presenta emorragie evidenti?
5) Ci sono traumi visibili, come fratture o contusioni?

Nel caso in cui 1-F, 2-T, 3-T:

6) Il paziente reagisce al tocco o a leggeri stimoli dolorosi?
7) Il paziente ha le pupille reattive alla luce?

Nel caso in cui 2-T:

8) La respirazione è regolare?
9) Quanto è frequente la respirazione? (respiri al minuto)

Nel caso in cui 3-T:

10) Il battito è regolare?
11) Quanti sono i battiti al minuto?

Se 1-T:

12) Il paziente ha difficolta a muoversi o sembra paralizzato in alcune parti del corpo?
13) Il paziente ha problemi medici noti?

a prescindere da 1,2,3:

14) Vuoi aggiungere altro di rilevante? (text area)

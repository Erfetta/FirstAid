# FIRSTAID

## TEST
per eseguire i test usare i rispettivi comandi:

test di registrazione e login: 

    rails test test/system/users_test.rb --verbose
test sul controller : 

    rails test test/controllers/user/home_controller_test.rb --verbose
test sul modello : 

    rails test test/models/user_test.rb --verbose

avviare i server per il test complesso

test report: 

    rails test test/system/report_flow_test.rb --verbose

## START SERVERS
per avviare i server aprire tre shell e digitare in una:

    rails server -e user -p 3000 --pid tmp/pids/server_user.pid
nella seconda:

    rails server -e operator -p 4000 --pid tmp/pids/server_operator.pid
nella terza:

    rails server -e supervisor -p 5000 --pid tmp/pids/server_supervisor.pid
    
poi visitare rispettivamente [localhost:3000](http://localhost:3000) e [localhost:4000](http://localhost:4000) [localhost:5000](http://localhost:5000) 


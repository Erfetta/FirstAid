# README

per avviare i server aprire due shell e digitare in una:

    rails server -e user -p 3000 --pid tmp/pids/server_user.pid
e nell'altra:

    rails server -e operator -p 4000 --pid tmp/pids/server_operator.pid
    
poi visitare rispettivamente [localhost:3000](http://localhost:3000) e [localhost:4000](http://localhost:4000)

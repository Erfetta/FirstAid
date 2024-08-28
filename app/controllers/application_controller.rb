# app/user/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Metodi comuni che possono essere usati in tutti i controller
  # Esempio: autenticazione dell'utente, gestione delle eccezioni, ecc.
end

module Supervisorpage
  class LoginController < ApplicationController

    def new
      # Mostra la pagina di login
      render 'supervisorpage/login/supervisor_login'
    end

    def create
      supervisor = Supervisor.find_by(email: params[:supervisor][:email])

      if supervisor && supervisor.valid_password?(params[:supervisor][:password])
        sign_in(:supervisor, supervisor)  # Usa devise per eseguire il login
        session[:supervisor_id] = supervisor.id  # Salva l'ID del supervisor nella sessione
        redirect_to root_path  # Reindirizza alla pagina principale
      else
        flash.now[:alert] = 'Credenziali non valide. Riprova.'
        render 'supervisorpage/login/supervisor_login'
      end
    end

    def destroy
      sign_out(current_supervisor)  # Esegui il logout del supervisor
      session.delete(:supervisor_id)  # Cancella l'ID dalla sessione
      redirect_to root_path
    end
  end
end
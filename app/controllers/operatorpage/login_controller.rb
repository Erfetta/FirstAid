module Operatorpage
  class LoginController < ApplicationController

    def new
      # Mostra la pagina di login
      render 'operatorpage/login/op_login'
    end

    def create
      operator = Operator.find_by(email: params[:operator][:email])

      if operator && operator.valid_password?(params[:operator][:password])
        sign_in(:operator, operator)  # Usa devise per eseguire il login
        session[:operator_id] = operator.id  # Salva l'ID dell'operatore nella sessione
        redirect_to root_path  # Reindirizza alla pagina principale
      else
        flash.now[:alert] = 'Credenziali non valide. Riprova.'
        render 'operatorpage/login/op_login'
      end
    end

    def destroy
      sign_out(current_operator)  # Esegui il logout dell'operatore
      session.delete(:operator_id)  # Cancella l'ID dalla sessione
      redirect_to root_path
    end
  end
end
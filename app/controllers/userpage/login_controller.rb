module Userpage
  class LoginController < ApplicationController

    def new
      # Mostra la pagina di login
      render 'userpage/profiles/user_login'
    end

    def create
      user = User.find_by(email: params[:user][:email])

      if user && user.valid_password?(params[:user][:password])
        sign_in(:user, user)  # Usa devise per eseguire il login
        session[:user_id] = user.id  # Salva l'ID dell'utente nella sessione
        redirect_to profile_path  # Reindirizza alla pagina principale
      else
        flash.now[:alert] = 'Credenziali non valide. Riprova.'
        render 'userpage/profiles/user_login'
      end
    end

    def destroy
      sign_out(current_user)  # Esegui il logout dell'utente
      session.delete(:user_id)  # Cancella l'ID dalla sessione
      redirect_to root_path
    end
  end
end
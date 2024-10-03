class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Permetti parametri extra durante la registrazione e l'aggiornamento dell'account
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Permetti parametri extra durante la registrazione e l'aggiornamento dell'account
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :sex, :age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, :sex, :age])
  end

  def after_sign_in_path_for(resource)
    profile_path  # Dopo il login, reindirizza a un'altra pagina
  end

  # Sovrascrivi il metodo di Devise per reindirizzare alla pagina di login personalizzata
  def after_sign_out_path_for(resource_or_scope)
    login_path  # Questo dovrebbe essere il percorso per la tua pagina di login personalizzata
  end

  # Definisci cosa fare quando un utente non autenticato prova ad accedere a una pagina protetta
  def authenticate_operator!
    if operator_signed_in?
      super
    else
      redirect_to login_path  # Reindirizza alla tua pagina di login personalizzata
    end
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to login_path  # Reindirizza alla tua pagina di login personalizzata
    end
  end

end

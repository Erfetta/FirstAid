class Userpage::ProfilesController < ApplicationController
  # Questo assicura che solo gli utenti autenticati possano accedere a queste azioni
  before_action :authenticate_user!, only: [:profile, :graph, :graphsetting, :info, :update]

  def profile
    # Logica per la pagina del profilo
  end

  def graph
    # Logica per la pagina del grafico
  end

  def graphsetting
    # Logica per le impostazioni del grafico
  end

  def info
    # Logica per le informazioni
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path, notice: 'Informazioni aggiornate con successo.'
    else
      render :info  # Ritorna alla vista se ci sono errori
    end
  end

  private

  def user_params
    params.require(:user).permit(:blood_type, :phone, :email)  # Assicurati di includere i campi che desideri aggiornare
  end
end

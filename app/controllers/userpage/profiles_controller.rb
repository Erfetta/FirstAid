class Userpage::ProfilesController < ApplicationController
  # Questo assicura che solo gli utenti autenticati possano accedere a queste azioni
  before_action :authenticate_user!, only: [:profile, :graph, :graphsetting, :info]

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
end

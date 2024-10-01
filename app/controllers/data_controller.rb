class DataController < ApplicationController
  before_action :set_user

  def create_pressure
    pressure = params[:pressure]  # Ottieni il valore della pressione dal form
    Data.create(tipo: 'Pressione', valore: pressure, user: @user)  # Crea un nuovo record con i dati
  end


  def create_bpm
    bpm = params[:bpm]
    Data.create(tipo: 'BPM', valore: bpm, user: @user)  # Usa 'user' invece di 'utente'
    redirect_to some_path
  end

  def create_oxygen
    oxygen = params[:oxygen]
    Data.create(tipo: 'Ossigeno', valore: oxygen, user: @user)  # Usa 'user' invece di 'utente'
    redirect_to some_path
  end

  private

  def set_user
    @user = current_user  # Assicurati di utilizzare il metodo corretto per ottenere l'utente attivo
  end
end


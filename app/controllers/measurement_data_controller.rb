class MeasurementDataController < ApplicationController
  def create_pressure
    @data = MeasurementData.new(
      measurement_type: 'pressure',
      value: params[:pressure],
      user: current_user # Assicurati che current_user sia valido
    )

    if @data.save
      flash[:notice] = 'Dati salvati con successo!'
      redirect_to request.referer # Questo mantiene l'utente sulla stessa pagina
    else
      Rails.logger.debug("Errors: #{@data.errors.full_messages}")
      flash[:alert] = "Errore nel salvataggio dei dati: #{@data.errors.full_messages.join(', ')}"
      redirect_to request.referer # Mantiene l'utente sulla stessa pagina anche in caso di errore
    end
  end
  def create_bpm
    @data = MeasurementData.new(
      measurement_type: 'bpm',
      value: params[:bpm],
      user: current_user # Assicurati che current_user sia valido
    )

    if @data.save
      flash[:notice] = 'Dati salvati con successo!'
      redirect_to request.referer # Questo mantiene l'utente sulla stessa pagina
    else
      Rails.logger.debug("Errors: #{@data.errors.full_messages}")
      flash[:alert] = "Errore nel salvataggio dei dati: #{@data.errors.full_messages.join(', ')}"
      redirect_to request.referer # Mantiene l'utente sulla stessa pagina anche in caso di errore
    end
  end
  def create_oxygen
    @data = MeasurementData.new(
      measurement_type: 'oxygen',
      value: params[:oxygen],
      user: current_user # Assicurati che current_user sia valido
    )

    if @data.save
      flash[:notice] = 'Dati salvati con successo!'
      redirect_to request.referer # Questo mantiene l'utente sulla stessa pagina
    else
      Rails.logger.debug("Errors: #{@data.errors.full_messages}")
      flash[:alert] = "Errore nel salvataggio dei dati: #{@data.errors.full_messages.join(', ')}"
      redirect_to request.referer # Mantiene l'utente sulla stessa pagina anche in caso di errore
    end
  end
  
end

class Userpage::ProfilesController < ApplicationController
  # Questo assicura che solo gli utenti autenticati possano accedere a queste azioni
  before_action :authenticate_user!, only: [:profile, :graph, :graphsetting, :info, :update]

  def profile
    @pressure_data = MeasurementData.where(measurement_type: 'Pressione', user_id: current_user.id)
    @bpm_data = MeasurementData.where(measurement_type: 'BPM', user_id: current_user.id)
    @oxygen_data = MeasurementData.where(measurement_type: 'Ossigenazione', user_id: current_user.id)
  end

  def graph
    # Recupera i dati per la grafica
    @pressure_data = current_user.measurement_data.where(measurement_type: 'pressure').order(created_at: :desc)
    @bpm_data = current_user.measurement_data.where(measurement_type: 'bpm').order(created_at: :desc)
    @oxygen_data = current_user.measurement_data.where(measurement_type: 'oxygen').order(created_at: :desc)

    time_ago = case cookies[:graph_time].to_i
    when 1 then 1.minute.ago
    when 2 then 2.minutes.ago
    when 6 then 6.minutes.ago
    when 12 then 12.minutes.ago
    else 1.minute.ago
    end

    @bpm_data = current_user.measurement_data
                        .where(measurement_type: 'bpm')
                        .where("created_at >= ?", time_ago)
                        .order(:created_at)

    @pressure_data = current_user.measurement_data
                                .where(measurement_type: 'pressure')
                                .where("created_at >= ?", time_ago)
                                .order(:created_at)

    @oxygen_data = current_user.measurement_data
                              .where(measurement_type: 'oxygen')
                              .where("created_at >= ?", time_ago)
                              .order(:created_at)
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

  def update_delete_data_after
    # Supponendo che il record sia associato all'utente autenticato
    user = current_user
    if user.update(delete_data_after: params[:delete_data_after])
      render json: { success: true, message: 'Impostazione aggiornata con successo' }
    else
      render json: { success: false, errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:blood_type, :phone, :email)  # Assicurati di includere i campi che desideri aggiornare
  end
end

# app/models/user.rb
class User < ApplicationRecord  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reports
  has_many :reports_done
  has_many :measurement_data, class_name: 'MeasurementData', dependent: :destroy

  def delete_old_data
    return unless delete_data_after.present?

    # Converte il valore in un numero (gestione di stringhe come "2-minutes")
    delete_after_in_minutes = delete_data_after.to_i
    cutoff_time = Time.now - delete_after_in_minutes.minutes

    # Cancella i dati obsoleti
    measurement_data.where('created_at < ?', cutoff_time).destroy_all
  end

end

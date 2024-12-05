# app/models/user.rb
class User < ApplicationRecord  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reports
  has_many :reports_done
  has_many :measurement_data, class_name: 'MeasurementData', dependent: :destroy

end

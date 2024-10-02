class MeasurementData < ApplicationRecord
  belongs_to :user

  validates :measurement_type, presence: true
  validates :value, presence: true
  validates :user_id, presence: true
end

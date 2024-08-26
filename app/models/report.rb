class Report < ApplicationRecord
  belongs_to :user
  belongs_to :operator, optional: true # Qui rendi opzionale l'operatore

  validates :report_time, presence: true
  validates :report_date, presence: true
  validates :coordinates, presence: true
end


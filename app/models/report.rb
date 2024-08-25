# app/models/report.rb
class Report < ApplicationRecord
  belongs_to :user
  belongs_to :operator

  # Assicurati che tutti i campi siano presenti e validi
  validates :ora, :data, :coordinate, presence: true
end

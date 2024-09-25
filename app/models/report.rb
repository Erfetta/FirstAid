class Report < ApplicationRecord
  belongs_to :user
  belongs_to :operator, optional: true # Qui rendi opzionale l'operatore

  validates :coordinates, presence: true
end


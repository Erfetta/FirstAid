class Supervisor < ApplicationRecord
  has_many :operators
  has_many :reports_done, through: :operators
end

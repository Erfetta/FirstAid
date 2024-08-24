class Operator < ApplicationRecord
  belongs_to :supervisor
  has_many :reports
  has_many :reports_done
end

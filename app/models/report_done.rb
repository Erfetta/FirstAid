class ReportDone < ApplicationRecord
  belongs_to :supervisor
  belongs_to :user
  belongs_to :operator

  validates :time, :date, :coordinates, presence: true
end

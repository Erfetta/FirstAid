class Report < ApplicationRecord
  belongs_to :user
  belongs_to :operator

  validates :report_time, :report_date, :coordinates, presence: true
end

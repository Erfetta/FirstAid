class ReportDone < ApplicationRecord
  belongs_to :user
  belongs_to :operator

  validates :report_time, :coordinates, :user_id, :contact_method, presence: true
end

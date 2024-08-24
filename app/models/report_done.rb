class ReportDone < ApplicationRecord
  belongs_to :supervisor
  belongs_to :user
  belongs_to :operator
end

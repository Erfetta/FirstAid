class Users < ApplicationRecord
  has_many :reports
  has_many :reports_done
end

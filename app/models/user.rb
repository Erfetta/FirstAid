# app/models/user.rb
class User < ApplicationRecord
  has_many :reports
  has_many :reports_done

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end

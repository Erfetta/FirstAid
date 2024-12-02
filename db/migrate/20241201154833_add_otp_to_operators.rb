class AddOtpToOperators < ActiveRecord::Migration[6.1]
  def change
    add_column :operators, :otp, :string
    add_column :operators, :otp_expires_at, :datetime
  end
end

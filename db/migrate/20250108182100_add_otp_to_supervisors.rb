class AddOtpToSupervisors < ActiveRecord::Migration[6.1]
  def change
    add_column :supervisors, :otp, :string
    add_column :supervisors, :otp_expires_at, :datetime
  end
end

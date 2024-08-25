class AddAcceptedToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :accepted, :boolean
    add_column :reports, :default, :false
  end
end

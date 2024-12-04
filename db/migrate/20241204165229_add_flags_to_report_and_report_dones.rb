class AddFlagsToReportAndReportDones < ActiveRecord::Migration[6.1]
  def change

    add_column :reports, :flagCell, :integer
    add_column :reports, :flagInfo, :integer
    add_column :report_dones, :flagCell, :integer
    add_column :report_dones, :flagInfo, :integer
    
  end
end

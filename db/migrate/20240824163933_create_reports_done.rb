class CreateReportsDone < ActiveRecord::Migration[6.0]
  def change
    create_table :reports_done do |t|
      t.integer :operator_id
      t.integer :user_id
      t.time :time
      t.date :date
      t.string :coordinates

      t.timestamps
    end
    add_foreign_key :reports_done, :users
    add_foreign_key :reports_done, :operators
  end
end




class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.time :report_time
      t.date :report_date
      t.string :coordinates
      t.integer :user_id
      t.integer :operator_id, null: true # Questo permette i valori NULL
      t.boolean :accepted, default: false

      t.timestamps
    end
    add_foreign_key :reports, :users
    add_foreign_key :reports, :operators
  end
end



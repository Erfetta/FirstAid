class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.time :ora
      t.date :data
      t.string :coordinate
      
      t.references :user, foreign_key: true
      t.references :operator, foreign_key: true

      t.timestamps
    end
  end
end

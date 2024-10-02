class CreateMeasurementData < ActiveRecord::Migration[6.0]
  def change
    create_table :measurement_data do |t|
      t.string :measurement_type
      t.float :value
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

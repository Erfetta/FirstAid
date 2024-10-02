class CreateData < ActiveRecord::Migration[6.1]
  def change
    create_table :data do |t|
      t.string :measurement_type  # Cambiato da 'tipo' a 'measurement_type'
      t.float :value              # Cambiato da 'valore' a 'value'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

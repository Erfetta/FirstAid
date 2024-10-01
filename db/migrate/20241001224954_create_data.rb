class CreateData < ActiveRecord::Migration[6.1]
  def change
    create_table :data do |t|
      t.string :tipo
      t.float :valore
      t.references :user, null: false, foreign_key: true  # Assicurati che il nome sia 'user'

      t.timestamps
    end
  end
end

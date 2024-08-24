class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.integer :id, primary_key: true, limit: 6 # ID a 6 cifre
      t.string :nome
      t.string :cognome
      t.string :email
      t.string :numero_di_telefono
      t.integer :eta
      t.string :sesso

      t.timestamps
    end
  end
end


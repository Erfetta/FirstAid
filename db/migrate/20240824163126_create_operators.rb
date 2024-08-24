class CreateOperators < ActiveRecord::Migration[6.0]
  def change
    create_table :operators, id: false do |t|
      t.integer :id, primary_key: true, limit: 6 # ID a 6 cifre
      t.string :nome
      t.string :cognome
      t.string :email
      t.string :telefono
      t.integer :eta
      t.string :sesso

      # Aggiungi la colonna supervisor_id come chiave esterna
      t.references :supervisor, type: :integer, foreign_key: { to_table: :supervisors }

      t.timestamps
    end
  end
end

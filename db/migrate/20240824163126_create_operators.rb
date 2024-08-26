class CreateOperators < ActiveRecord::Migration[6.0]
  def change
    create_table :operators, id: false do |t|
      t.integer :id, primary_key: true, limit: 6 # ID a 6 cifre
      t.string :name
      t.string :surname
      t.string :email
      t.string :telephone_number
      t.integer :age
      t.string :sex

      # Aggiungi la colonna supervisor_id come chiave esterna
      t.references :supervisor, type: :integer, foreign_key: { to_table: :supervisors }

      t.timestamps
    end
  end
end

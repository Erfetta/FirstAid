class CreateReportsDone < ActiveRecord::Migration[6.0]
  def change
    create_table :reports_done, id: false do |t|
      t.integer :id, primary_key: true, limit: 6 # ID a 6 cifre
      t.string :nome_operatore
      t.string :nome_utente # Nome dell'utente che ha effettuato il report
      t.datetime :ora
      t.date :data
      t.string :coordinate

      # Aggiungi la colonna user_id come chiave esterna
      t.references :user, type: :integer, foreign_key: true
      # Aggiungi la colonna operator_id come chiave esterna
      t.references :operator, type: :integer, foreign_key: true
      # Aggiungi la colonna supervisor_id come chiave esterna
      t.references :supervisor, type: :integer, foreign_key: { to_table: :supervisors }

      t.timestamps
    end
  end
end



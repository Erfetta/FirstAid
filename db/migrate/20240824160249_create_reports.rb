class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports, id: false do |t|
      t.integer :id, primary_key: true, limit: 6 # ID a 6 cifre
      t.string :nome_operatore
      t.time :ora
      t.date :data
      t.string :coordinate

      t.references :user, type: :integer, foreign_key: true
      t.references :operator, type: :integer, foreign_key: true

      t.timestamps
    end
  end
end

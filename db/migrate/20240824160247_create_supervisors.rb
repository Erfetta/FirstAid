class CreateSupervisors < ActiveRecord::Migration[6.0]
  def change
    create_table :supervisors, id: false do |t|
      t.integer :id, primary_key: true, limit: 6 # ID a 6 cifre
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end


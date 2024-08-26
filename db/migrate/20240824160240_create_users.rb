class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.integer :id, primary_key: true, limit: 6 # ID a 6 cifre
      t.string :name
      t.string :surname
      t.string :email
      t.string :telephone_number
      t.integer :age
      t.string :sex

      t.timestamps
    end
  end
end


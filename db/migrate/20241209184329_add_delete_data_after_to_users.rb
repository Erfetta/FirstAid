class AddDeleteDataAfterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :delete_data_after, :string
  end
end

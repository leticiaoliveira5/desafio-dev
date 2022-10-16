class AddCnabFileToStores < ActiveRecord::Migration[7.0]
  def change
    remove_column :stores, :user_id
    add_column :stores, :cnab_file_id, :integer
  end
end

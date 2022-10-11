class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|

      t.timestamps
      t.string :name, null: false
      t.string :owner, null: false
      t.integer :user_id, null: false
    end
  end
end

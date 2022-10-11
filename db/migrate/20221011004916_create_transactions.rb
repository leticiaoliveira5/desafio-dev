class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|

      t.timestamps
      t.integer :type
      t.datetime :sale_time
      t.float :amount
      t.string :document
      t.string :card
      t.integer :store_id
    end
  end
end

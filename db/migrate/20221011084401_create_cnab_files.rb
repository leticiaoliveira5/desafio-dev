class CreateCnabFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :cnab_files do |t|

      t.timestamps
      t.integer :user_id
    end
  end
end

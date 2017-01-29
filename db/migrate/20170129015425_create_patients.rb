class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :patients, :user_id
  end
end

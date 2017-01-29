class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.integer :doctor_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :favorites, :doctor_id
    add_index :favorites, :user_id
  end
end

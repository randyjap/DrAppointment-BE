class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      t.string :country_code, null: false
      t.string :authy_id, null: false
      t.string :session_token, null: false
      t.string :status, null: false
      t.timestamps
    end
    add_index :users, :phone_number, unique: true
    add_index :users, :session_token
  end
end

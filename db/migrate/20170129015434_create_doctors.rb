class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :salutation, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :street, null: false
      t.string :street_number, null: false
      t.string :city, null: false
      t.string :zip_code, null: false
      t.string :state, null: false
      t.float :lat, null: false
      t.float :lng, null: false
      t.string :image_url, null: false
      t.string :phone_number, null: false
      t.timestamps
    end
    add_index :doctors, :first_name
    add_index :doctors, :last_name
    add_index :doctors, :lat
    add_index :doctors, :lng
  end
end

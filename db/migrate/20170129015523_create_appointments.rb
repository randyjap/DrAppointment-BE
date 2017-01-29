class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :doctor_id, null: false
      t.integer :time_slot_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :appointments, :doctor_id
    add_index :appointments, :time_slot_id
    add_index :appointments, :user_id
  end
end

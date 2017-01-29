class CreateTimeSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :time_slots do |t|
      t.integer :appointment_date_id, null: false
      t.string :time, null: false
      t.timestamps
    end
    add_index :time_slots, :appointment_date_id
  end
end

class CreateBlockedTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :blocked_times do |t|
      t.integer :doctor_id, null: false
      t.integer :time_slot_id, null: false
      t.timestamps
    end
    add_index :blocked_times, :doctor_id
    add_index :blocked_times, :time_slot_id
  end
end

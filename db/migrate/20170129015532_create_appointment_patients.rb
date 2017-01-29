class CreateAppointmentPatients < ActiveRecord::Migration[5.0]
  def change
    create_table :appointment_patients do |t|
      t.integer :appointment_id, null: false
      t.integer :patient_id, null: false
      t.timestamps
    end
    add_index :appointment_patients, :appointment_id
    add_index :appointment_patients, :patient_id
  end
end

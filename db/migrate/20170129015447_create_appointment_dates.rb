class CreateAppointmentDates < ActiveRecord::Migration[5.0]
  def change
    create_table :appointment_dates do |t|
      t.date :appointment_date, null: false
      t.timestamps
    end
    add_index :appointment_dates, :appointment_date, unique: true
  end
end

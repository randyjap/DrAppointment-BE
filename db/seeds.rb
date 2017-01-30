User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone_number: '5555555',
  country_code: '+1',
  authy_id: rand(100000..999999)
)

Doctor.create(
  salutation: "MD",
  first_name: "Richard",
  last_name: "Kimble",
  street: "Spear Street",
  street_number: "160",
  city: "San Francisco",
  lat: 37.791305,
  lng: -122.3959239
)

21.times do |i|
  appointment_date = AppointmentDate.create(
    appointment_date: Date.today + i
  )
  hours = 8
  minutes = 0
  (45).times do
    hour_string = hours.to_s.rjust(2, "0")
    minute_string = minutes.to_s.rjust(2, "0")
    TimeSlot.create(
      time: "#{hour_string}:#{minute_string}",
      appointment_date: appointment_date
    )
    minutes += 15
    if minutes >= 60
      hours += 1
      minutes = 0
    end
  end
end

4.times do |i|
  BlockedTime.create(
    doctor: Doctor.first,
    time_slot: TimeSlot.find(i + 1)
  )
end

Appointment.create(
  doctor: Doctor.first,
  time_slot: TimeSlot.find(5),
  user: User.first
)

Patient.create(
  first_name: "Anna",
  last_name: "Kimble",
  user: User.find(1)
)

AppointmentPatient.create(
  appointment: Appointment.first,
  patient: Patient.first
)

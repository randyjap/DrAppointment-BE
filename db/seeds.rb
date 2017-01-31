User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone_number: '5555555555',
  authy_id: rand(100000..999999)
)

Doctor.create(
  salutation: "MD",
  first_name: "Richard",
  last_name: "Kimble",
  street: "Spear Street",
  street_number: "160",
  city: "San Francisco",
  zip_code: "99999",
  state: "California",
  lat: 37.791305,
  lng: -122.3959239,
  image_url: "http://previews.123rf.com/images/dolgachov/dolgachov1307/dolgachov130700003/20557312-picture-of-young-team-or-group-of-doctors-Stock-Photo-doctors-doctor-medical.jpg",
  phone_number: '5555555555'
)

21.times do |i|
  appointment_date = AppointmentDate.create(
    appointment_date: Date.today + i
  )
  hours = 8
  minutes = 0
  45.times do
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

Favorite.create(
  user: User.first,
  doctor: Doctor.first
)

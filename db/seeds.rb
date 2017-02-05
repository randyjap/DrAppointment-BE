User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  phone_number: '5555555555',
  authy_id: 123123
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
  image_url: "https://static.pexels.com/photos/34983/pexels-photo.jpg",
  phone_number: '5555555555'
)

Doctor.create(
  salutation: "MD",
  first_name: "James",
  last_name: "Moriarty",
  street: "Baker Street",
  street_number: "221B",
  city: "London",
  zip_code: "99999",
  state: "California",
  lat: 37.791305,
  lng: -122.3959239,
  image_url: "https://static.pexels.com/photos/34983/pexels-photo.jpg",
  phone_number: '5555555554'
)

Doctor.create(
  salutation: "MD",
  first_name: "Who",
  last_name: "Who",
  street: "Telephone Booth",
  street_number: "Anywhere",
  city: "London",
  zip_code: "99999",
  state: "California",
  lat: 37.791305,
  lng: -122.3959239,
  image_url: "https://static.pexels.com/photos/34983/pexels-photo.jpg",
  phone_number: '5555555554'
)

30.times do
  Doctor.create(
    salutation: "MD",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    street: Faker::Address.street_name,
    street_number: Faker::Address.building_number,
    city: Faker::Address.city,
    zip_code: Faker::Address.zip[0..4],
    state: Faker::Address.state,
    lat: rand(37.711537399325096..37.77940697341724),
    lng: rand(-122.47692206127931..-122.40310766918947),
    image_url: "https://static.pexels.com/photos/34983/pexels-photo.jpg",
    phone_number: "555555#{rand(1000..9999)}"
  )
end

50.times do |i|
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
  user: User.first,
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

Favorite.create(
  user: User.first,
  doctor: Doctor.last
)

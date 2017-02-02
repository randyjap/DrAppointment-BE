json.array! @doctors do |doctor|
  name = "#{doctor.salutation} #{doctor.first_name} #{doctor.last_name} #{doctor.street_number} #{doctor.street}, #{doctor.city}"
  name = "#{name[0..30]}..." if name.length > 31
  json.image_url doctor.image_url
  json.id doctor.id
  json.name name
  json.phone "+1 #{doctor.phone_number}"
  json.favorited @user.favorite_doctors.include?(Doctor.find(doctor.id))
end.sort_by! { |el| el["favorited"].to_s }.reverse!

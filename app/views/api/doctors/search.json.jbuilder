json.array! @doctors do |doctor|
  name = "#{doctor.salutation} #{doctor.first_name} #{doctor.last_name} #{doctor.street_number} #{doctor.street}, #{doctor.city}"
  name = "#{name[0..30]}..." if name.length > 31
  json.id doctor.id
  json.name name
  json.favorited @user.favorite_doctors.include?(Doctor.first)
end

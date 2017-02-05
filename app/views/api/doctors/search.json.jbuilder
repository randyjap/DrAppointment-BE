json.array! @doctors do |doctor|
  name = "#{doctor.salutation} #{doctor.first_name} #{doctor.last_name} #{doctor.street_number} #{doctor.street}, #{doctor.city}"
  name = "#{name[0..30]}..." if name.length > 31
  json.image_url doctor.image_url
  json.id doctor.id
  json.name name
  json.address "#{@doctor.street_number} #{@doctor.street}"
  json.address2 "#{@doctor.city}, #{@doctor.state} #{@doctor.zip_code}"
  json.phone "+1 #{doctor.phone_number}"
  json.favorited @user.favorite_doctors.include?(Doctor.find(doctor.id))
  json.lat doctor.lat
  json.lng doctor.lng
  json.distance (Math.sqrt((@lng - doctor.lng)**2 + (@lat - doctor.lat)**2) * 70.117663977182174).round(1)
end.sort_by! do |el|
  [el["favorited"].to_s, -el["distance"]]
end.reverse!

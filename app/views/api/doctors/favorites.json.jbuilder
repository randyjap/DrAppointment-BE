json.array! @doctors do |doctor|
  name = "#{doctor.salutation} #{doctor.first_name} #{doctor.last_name}"
  json.image_url doctor.image_url
  json.name name
  json.phone "#{doctor.country_code} #{doctor.phone_number}"
end

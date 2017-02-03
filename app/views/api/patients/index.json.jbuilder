json.array! @patients do |patient|
  json.id patient.id
  json.first_name patient.first_name
  json.last_name patient.last_name
end

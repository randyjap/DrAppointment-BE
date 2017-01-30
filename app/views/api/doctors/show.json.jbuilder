name = "#{@doctor.salutation} #{@doctor.first_name} #{@doctor.last_name}"

json.id @doctor.id
json.name name
json.address "#{@doctor.street_number} #{@doctor.street}"
json.address2 "#{@doctor.city}, #{@doctor.state} #{@doctor.zip_code}"
json.distance "1.2 miles" ##TODO
json.image_url @doctor.image_url
json.timeslots @doctor_schedule
@doctor_schedule_2

# "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"

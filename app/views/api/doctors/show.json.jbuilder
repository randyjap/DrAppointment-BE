name = "#{@doctor.salutation} #{@doctor.first_name} #{@doctor.last_name}"

json.id @doctor.id
json.name name
json.address "#{@doctor.street_number} #{@doctor.street}"
json.address2 "#{@doctor.city}, #{@doctor.state} #{@doctor.zip_code}"
json.image_url @doctor.image_url
json.favorited @user.favorite_doctors.include?(Doctor.first)

json.first_day @doctor_schedule do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
  json.id schedule.id
end

json.second_day @doctor_schedule_2 do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
  json.id schedule.id
end

json.third_day @doctor_schedule_3 do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
  json.id schedule.id
end

json.fourth_day @doctor_schedule_4 do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
  json.id schedule.id
end

json.fifth_day @doctor_schedule_5 do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
  json.id schedule.id
end

json.sixth_day @doctor_schedule_6 do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
  json.id schedule.id
end

json.seventh_day @doctor_schedule_7 do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
  json.id schedule.id
end

json.eighth_day @doctor_schedule_8 do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
  json.id schedule.id
end

json.nineth_day @doctor_schedule_9 do |schedule|
  json.time schedule.time
  status = "Open"
  if @doctor.blocked_times.map { |blocked_time| blocked_time.time_slot }.include?(schedule)
    status = "N/A"
  elsif @doctor.appointments.map { |appointment| appointment.time_slot }.include?(schedule)
    status = "Full"
  end
  json.status status
  date = schedule.appointment_date.appointment_date
  json.date "#{date.strftime("%m")}/#{date.strftime("%d")} (#{date.strftime("%a")})"
  json.id schedule.id
end

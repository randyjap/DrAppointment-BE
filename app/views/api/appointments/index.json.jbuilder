json.array! @appointments do |appointment|
  doctor = appointment.doctor
  json.doctor "#{doctor.salutation} #{doctor.first_name} #{doctor.last_name}"
  json.id appointment.id
  json.notes appointment.notes
  json.day appointment.time_slot.appointment_date.appointment_date
  json.time (appointment.time_slot.time[0..1].to_i < 12 ? "#{appointment.time_slot.time} am" : appointment.time_slot.time)
  json.patients appointment.patients.map { |patient| "#{patient.first_name} #{patient.last_name}" }.join(" and ")
end

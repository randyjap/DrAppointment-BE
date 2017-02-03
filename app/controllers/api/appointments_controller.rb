class Api::AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    doctor = Doctor.find(params[:appointment][:doctorId])
    user = current_user
    time_slot = TimeSlot.find(params[:appointment][:timeSlot])
    patients = params[:appointment][:patients].map { |patient| Patient.find(patient[:id]) }
    notes = params[:appointment][:notes]

    @appointment = Appointment.new(
      doctor: doctor,
      user: user,
      time_slot: time_slot,
      notes: notes
    )

    if @appointment.save
      patients.each do |patient|
        AppointmentPatient.create(
          patient: patient,
          appointment: @appointment
        )
      end
      account_sid = ENV["twilio_account_sid"]
      auth_token = ENV["twilio_auth_token"]
      to = "1 #{user.phone_number}"
      from = ENV["twilio_phone_number"]
      time = @appointment.time_slot.time[0..1].to_i < 12 ? "#{@appointment.time_slot.time} am" : @appointment.time_slot.time
      doctor_name = "#{doctor.salutation} #{doctor.first_name} #{doctor.last_name}"
      patient_names = patients.map { |patient| "#{patient.first_name} #{patient.last_name}" }.join(" and ")
      message = "Your appointment for #{patient_names} is confirmed at #{time} on #{@appointment.time_slot.appointment_date.appointment_date} with #{doctor_name}"
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      @client.account.messages.create({
          :to => to,
          :from => from,
          :body => message
      })
      render json: @appointment, status: 200
    else
      render json: @appointment.errors.full_messages, status: 422
    end
  end
end

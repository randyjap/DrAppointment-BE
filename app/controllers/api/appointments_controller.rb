class Api::AppointmentsController < ApplicationController
  def create
    doctor = Doctor.find(params[:appointment][:doctor_id]),
    user = User.find(params[:appointment][:user_id]),
    time_slot = TimeSlot.find(params[:appointment][:time_slot_id])

    @appointment = Appointment.new(
      doctor: doctor,
      user: user,
      time_slot: time_slot
    )

    if @appointment.save
      account_sid = ENV["twilio_account_sid"]
      auth_token = ENV["twilio_auth_token"]
      to = "1 #{user.phone_number}"
      from = ENV["twilio_phone_number"]
      doctor_name = "#{doctor.salutation} #{doctor.first_name} #{doctor.last_name}"

      message = "Your appointment is confirmed at #{@appointment.time_slot.time} with #{doctor_name}"
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

class Api::DoctorsController < ApplicationController
  def search
    @user = User.first
    @doctors = Doctor.all
  end

  def favorites
    user = User.first
    @doctors = user.favorite_doctors
  end

  def show
    @user = User.first
    @doctor = Doctor.find(params[:id])
    @doctor_schedule = @doctor.timeslots(Date.today)
    @doctor_schedule_2 = @doctor.timeslots(Date.today + 1)
    @doctor_schedule_3 = @doctor.timeslots(Date.today + 2)
  end
end

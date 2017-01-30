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
    @doctor = Doctor.find(params[:id])
    @doctor_schedule = @doctor.schedule(Date.today)
    @doctor_schedule_2 = @doctor.schedule(Date.today + 1)
    @doctor_schedule_3 = @doctor.schedule(Date.today + 2)
  end
end

class Api::DoctorsController < ApplicationController
  def search
    @user = User.first
    @doctors = Doctor.all
  end

  def favorites
    user = current_user
    @doctors = user.favorite_doctors
  end

  def show
    if current_user
      @user = User.first
      @doctor = Doctor.find(params[:id])
      @doctor_schedule = @doctor.timeslots(Date.today)
      @doctor_schedule_2 = @doctor.timeslots(Date.today + 1)
      @doctor_schedule_3 = @doctor.timeslots(Date.today + 2)
    else
      render json: "You are not authorized", status: 401
    end
  end
end

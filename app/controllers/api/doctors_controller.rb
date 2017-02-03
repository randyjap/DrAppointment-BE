class Api::DoctorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def search
    @user = current_user
    if params[:input].nil? || params[:input][:name].nil?
      @lat = params[:input][:lat]
      @lng = params[:input][:lng]
      @doctors = Doctor.all
    else
      @lat = params[:input][:lat]
      @lng = params[:input][:lng]
      @doctors = Doctor.where(
        "lower(first_name) LIKE ? OR lower(last_name) LIKE ?",
        "%#{params[:input][:name].downcase}%",
        "%#{params[:input][:name].downcase}%"
      )
    end
  end

  def favorites
    if current_user
      @doctors = User.first.favorite_doctors
    else
      render json: ["You are not authorized, please login first"], status: 401
    end
  end

  def show
    if current_user
      @doctor = Doctor.find(params[:id])
      @doctor_schedule = @doctor.timeslots(Date.today)
      @doctor_schedule_2 = @doctor.timeslots(Date.today + 1)
      @doctor_schedule_3 = @doctor.timeslots(Date.today + 2)
      @doctor_schedule_4 = @doctor.timeslots(Date.today + 3)
      @doctor_schedule_5 = @doctor.timeslots(Date.today + 4)
      @doctor_schedule_6 = @doctor.timeslots(Date.today + 5)
    else
      render json: ["You are not authorized, please login first"], status: 401
    end
  end
end

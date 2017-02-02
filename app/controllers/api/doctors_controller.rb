class Api::DoctorsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def search
    @user = User.first
    if params[:input].nil? || params[:input][:name].empty?
      @doctors = Doctor.all
      @lat = 128
      @lng = -38
    else
      @lat = 128
      @lng = -38
      # @lat = params[:input][:lat]
      # @lng = params[:input][:lng]
      @doctors = Doctor.where(
        "lower(first_name) LIKE ? OR lower(last_name) LIKE ?",
        "%#{params[:input][:name].downcase}%",
        "%#{params[:input][:name].downcase}%"
      )
    end
  end

  def favorites
    if User.first
      @doctors = User.first.favorite_doctors
    else
      render json: ["You are not authorized, please login first"], status: 401
    end
  end

  def show
    if current_user
      @user = User.first
      @doctor = Doctor.find(params[:id])
      @doctor_schedule = @doctor.timeslots(Date.today)
      @doctor_schedule_2 = @doctor.timeslots(Date.today + 1)
      @doctor_schedule_3 = @doctor.timeslots(Date.today + 2)
    else
      render json: ["You are not authorized, please login first"], status: 401
    end
  end
end

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
      @doctors = current_user.favorite_doctors
    else
      render json: ["You are not authorized, please login first"], status: 401
    end
  end

  def toggle_favorite_doctor
    if current_user && params[:doctorId]
      if fav = Favorite.find_by(doctor_id: params[:doctorId])
        fav.delete
        return render json: fav, status: 200
      else
        fav = Favorite.new(
        user: current_user,
        doctor: Doctor.find(params[:doctorId])
        )
        return render json: fav, status: 200
      end
    else
      render json: ["Can't create favorite"], status: 401
    end
  end

  def show
    if @user = current_user
      @doctor = Doctor.find(params[:id])
      @doctor_schedule = []

      30.times do |i|
        @doctor_schedule << @doctor.timeslots(Date.today + i + 1)
      end
    else
      render json: ["You are not authorized, please login first"], status: 401
    end
  end
end

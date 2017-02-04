class Api::PatientsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    patient = Patient.new(
      first_name: params[:patient][:firstName],
      last_name: params[:patient][:lastName],
      user: current_user
    )
    if patient.save
      render json: patient, status: 200
    else
      render status: 401
    end
  end

  def index
    @patients = current_user.patients
  end

  def destroy
    patient = Patient.find(params[:id])
    if patient && current_user.patients.include?(patient)
      patient.delete
      render json: patient, status: 200
    else
      render json: "can't delete patient", status: 401
    end
  end
end

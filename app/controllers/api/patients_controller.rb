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
    # @patients = User.find(1).patients
  end

  def destroy

  end
end

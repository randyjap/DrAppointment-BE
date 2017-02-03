class Api::PatientsController < ApplicationController
  def create

  end

  def index
    # @patients = current_user.patients
    @patients = User.find(1).patients
  end

  def destroy

  end
end

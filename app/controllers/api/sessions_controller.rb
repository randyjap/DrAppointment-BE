class Api::SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @user = User.find_by(
      phone_number: params[:user][:phone_number],
      authy_id: params[:user][:authy_id]
    )

    if @user
      sign_in(@user)
      render json: @user
    else
      error = ["Invalid username or password"]
      render json: error, status: 401
    end
  end
end

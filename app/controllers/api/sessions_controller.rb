class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.find_by(
      phone_number: params[:user][:phone_number],
      authy_id: params[:user][:authy_id]
    )

    if @user
      @user.update(status: "authenticated")
      sign_in(@user)
      render json: @user
    else
      render json: ["Invalid verification code"], status: 401
    end
  end
end

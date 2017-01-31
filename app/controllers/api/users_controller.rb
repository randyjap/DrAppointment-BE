class Api::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @user = User.new(user_params)
    if @user.save
      account_sid = ENV["twilio_account_sid"]
      auth_token = ENV["twilio_auth_token"]
      to = "#{@user.country_code} #{@user.phone_number}"
      from = ENV["twilio_phone_number"]
      message = "Please enter verification code #{@user.authy_id}"
      @client = Twilio::REST::Client.new(account_sid, auth_token)
      @client.account.messages.create({
          :to => to,
          :from => from,
          :body => message
      })
      render json: @user, status: 200
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :country_code, :phone_number)
  end
end

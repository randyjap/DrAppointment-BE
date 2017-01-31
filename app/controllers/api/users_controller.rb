class Api::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    account_sid = ENV["twilio_account_sid"]
    auth_token = ENV["twilio_auth_token"]
    from = ENV["twilio_phone_number"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.account.messages.create({
        :to => params[:user][:to],
        :from => from,
        :body => params[:user][:message],
    })

    render json: "got it!", status: 200

    # @user = User.new(user_params)
    # if @user.save
    #   session[:user_id] = @user.id
    #   authy = Authy::API.register_user(
    #     cellphone: @user.phone_number,
    #     country_code: @user.country_code,
    #     email: "test@example.com"
    #   )
    #   @user.update(authy_id: authy.id)
    #   render json: @user, status: 200
    # else
    #   render json: @user.errors.full_messages, status: 422
    # end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :country_code, :phone_number)
  end
end

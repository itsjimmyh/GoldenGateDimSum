module Api
  class SessionsController < Devise::SessionsController

  respond_to :json

  skip_before_filter :verify_signed_out_user, only: :destroy

  # before_filter :authenticate_user!

  def create
    # find user from session cookie -> email, then authenticate
    @user = User.find_for_database_authentication(email: session_params[:email])
    # sleep helps test pace loading
    # sleep 3
    if @user && @user.valid_password?(session_params[:password])
      @user.reload
      sign_in(@user)
      # sessions_create_console_testing_printouts
      render :show
      return
    end

    # return prevents login error
    invalid_login_attempt_error
  end

  def destroy
    # before_session_destroy_signout_console_testing_printout

    # sleep tests pace loading
    # sleep 3
    # devise sign_out user
    sign_out(resource_name)

    # after_session_destroy_signout_console_testing_printout

    # should return new csrf_token for subsequent registrations because not refreshing page
    # no longer getting unable to verify csrf_token, so no need
    # render json: { csrf_token: form_authenticity_token }
    render json: { message: 'Signed Out' }
  end


  private
  def invalid_login_attempt_error
    # create a custom message to return when login error
    warden.custom_failure!
    render status: 401, json: { success: false, message: 'Invalid Login Credentials' }
  end

  def session_params
    params.require(:user).permit(:email, :password)
  end


  ## pretty print in terminal
  def sessions_create_console_testing_printouts
    p ""
    p "@user from sessions#create should be: user details"
    p ""
    p @user
    p ""
    p "@user from sessions#create should be: user details"
    p ""
    p "current api user from sessions#create"
    p ""
    p current_api_user
    p ""
    p "current api user from sessions#create"
    p ""
  end

  def before_session_destroy_signout_console_testing_printout
    p ""
    p "hitting destroy"
    p ""
    p "before sign_out(user) sessions#destroy should be: current_api_user details"
    p ""
    p current_api_user
    p ""
    p "before sign_out(user) sessions#destroy should be: current_api_user details"
  end

  def after_session_destroy_signout_console_testing_printout
    p ""
    p "after sign_out(user) from sessions#destroy should be: nil"
    p ""
    p current_api_user
    p ""
    p "after sign_out(user) from sessions#destroy should be: nil"
    p ""
  end

  def testing
    p ""
    p "these are the params I see in sessions_controller"
    p ""
    p params
    p ""
    p "these are the params I see in sessions_controller"
    p ""
  end

  end
end

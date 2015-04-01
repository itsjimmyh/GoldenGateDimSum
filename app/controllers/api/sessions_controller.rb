module Api
  class SessionsController < Devise::SessionsController

    respond_to :json

    # skip_before_filter :verify_signed_out_user, only: :destroy
    # before_filter :authenticate_user!

    def create
      # find user from session cookie -> email, then authenticate
      @user = User.find_for_database_authentication(email: session_params[:email])
      # sleep helps test pace loading
      # sleep 3
      if @user && @user.valid_password?(session_params[:password])
        sign_in(@user)
        # after signing in the user, refresh to show most updated saved user
        @user.reload
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
    # Strong Parameters
    def session_params
      params.require(:user).permit(:email, :password)
    end

    # Custom Error
    def invalid_login_attempt_error
      # create a custom message to return when login error
      warden.custom_failure!
      render status: 401, json: { success: false, message: 'Invalid Login Credentials' }
    end


    ## Testing, can delete later
    def sessions_create_console_testing_printouts
      p " ===== @user from sessions#create should be: user details ===== "
      p ap @user
      p " ===== @user from sessions#create should be: user details ===== "
      p ""
      p " ===== current api user from sessions#create ===== "
      p ap current_api_user
      p " ===== current api user from sessions#create ===== "
    end

    def before_session_destroy_signout_console_testing_printout
      p " ===== before sign_out(user) sessions#destroy should be: current_api_user details ===== "
      p ap current_api_user
      p " ===== before sign_out(user) sessions#destroy should be: current_api_user details ===== "
    end

    def after_session_destroy_signout_console_testing_printout
      p " ===== after sign_out(user) from sessions#destroy should be: nil ===== "
      p ap current_api_user
      p " ===== after sign_out(user) from sessions#destroy should be: nil ===== "
    end

    def testing
      p " ===== these are the params I see in sessions_controller ===== "
      p ap params
      p " ===== these are the params I see in sessions_controller ===== "
    end
  end
end

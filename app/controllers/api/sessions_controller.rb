module Api
  class SessionsController < Devise::SessionsController

    respond_to :json

    # skip_before_filter :verify_signed_out_user, only: :destroy
    # before_filter :authenticate_user!

    def create
      # find user from session cookie -> email, then authenticate
      @user = User.find_for_database_authentication(email: session_params[:email])
      if @user && @user.valid_password?(session_params[:password])
        sign_in(@user)
        # after signing in the user, refresh to show most updated saved user
        @user.reload
        render :show
        return
      end

      # return prevents login error
      invalid_login_attempt_error
    end

    def destroy
      # devise sign_out user
      sign_out(resource_name)
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
  end
end

module SessionsHelper

  ## Strong Parameters
  def session_params
    params.require(:user).permit(:email, :password)
  end

  ## Custom Error
  def invalid_login_attempt_error
    # create a custom message to return when login error
    warden.custom_failure!
    render status: 401, json: { success: false, message: 'Invalid Login Credentials' }
  end
end

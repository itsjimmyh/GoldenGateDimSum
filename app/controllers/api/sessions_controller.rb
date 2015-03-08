module Api
  class SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_filter :verify_signed_out_user

  # before_filter :testing

  def create
    @user = User.find_for_database_authentication( email: params_email )
    if @user.valid_password?(params_password)
      sign_in(:user, @user)
      render :show
      return
    end
    invalid_login_attempt
  end

  def destroy
    p ""
    p "hitting destroy"
    p ""
    sign_out(resource_name)
    render json: { csrf_token: form_authenticity_token }
  end

  private

  def invalid_login_attempt
    warden.custom_failure!
    render status: 401, json: { success: false, message: 'Invalid Login Credentials' }
  end

  def params_email
    params[:user][:email]
  end

  def params_password
    params[:user][:password]
  end

  def testing
    p ""
    p "these are the params I see in sessions_controller"
    p params
    p "these are the params I see in sessions_controller"
    p ""
  end

  end
end

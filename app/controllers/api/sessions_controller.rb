module Api
  class SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_filter :verify_signed_out_user, only: :destroy

  # before_filter :authenticate_user!

  def create
    @user = User.find_for_database_authentication(email: params_email)
    if @user && @user.valid_password?(params_password)
      @user.reload
      sign_in(@user)
      render :show
      p ""
      p "@user from sessions#create should be: user details"
      p @user
      p "@user from sessions#create should be: user details"
      p ""
      p "current api user from sessions#create"
      p current_api_user
      p "current api user from sessions#create"
      p ""
      return
    end
    invalid_login_attempt
  end

  def destroy
    p ""
    p "hitting destroy"
    p ""
    p "before sign_out(user) sessions#destroy should be: current_api_user details"
    p current_api_user
    p "before sign_out(user) sessions#destroy should be: current_api_user details"
    sign_out(resource_name)
    p "after sign_out(user) from sessions#destroy should be: nil"
    p current_api_user
    p "after sign_out(user) from sessions#destroy should be: nil"
    # should return new csrf_token for subsequent registrations
    # render json: { csrf_token: form_authenticity_token }
    render json: { message: 'Signed Out' }
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

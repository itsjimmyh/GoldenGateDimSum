module Api
  class RegistrationsController < Devise::RegistrationsController

    respond_to :json

    def create
      @user = User.new(user_params)
      if @user.save
        sign_in(@user)
        registrations_create_console_printout_testing
        render :show
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end


    private
    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :first_name,
        :last_name
      )
    end

    def registrations_create_console_printout_testing
      p "current_api_user from registrations#create"
      p ""
      p current_api_user
      p ""
      p "current_api_user from registrations#create"
    end

  end
end

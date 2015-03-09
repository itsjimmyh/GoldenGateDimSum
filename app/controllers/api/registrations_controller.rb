module Api
  class RegistrationsController < Devise::RegistrationsController

    respond_to :json

    def create
      @user = User.new(user_params)
      if @user.save
        sign_in(@user)
        p "current_api_user from registrations#create"
        p current_api_user
        p "current_api_user from registrations#create"
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

  end
end

module Api
  class RegistrationsController < Devise::RegistrationsController

    respond_to :json

    def create
      @user = User.new(user_params)
      if @user.save
        sign_in(:user, @user)
        render :show
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
        p user_params
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

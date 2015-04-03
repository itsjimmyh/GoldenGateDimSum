module Api
  class RegistrationsController < Devise::RegistrationsController

    respond_to :json

    def create
      @user = User.new(user_params)
      if @user.save
        sign_in(@user)
        # refresh user to show what's saved in database
        @user.reload
        render :show
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end


    private
    # Strong Parameters
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

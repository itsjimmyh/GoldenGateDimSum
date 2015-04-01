module Api
  class RegistrationsController < Devise::RegistrationsController

    respond_to :json

    def create
      @user = User.new(user_params)
      if @user.save
        sign_in(@user)
        # refresh user to show what's saved in database
        @user.reload
        # console printing, remove later
        # registrations_create_console_printout_testing
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

    # Testing methods, can delete later
    def registrations_create_console_printout_testing
      p " ===== current_api_user from registrations#create ===== "
      p ap current_api_user
      p " ===== current_api_user from registrations#create ===== "
    end

  end
end

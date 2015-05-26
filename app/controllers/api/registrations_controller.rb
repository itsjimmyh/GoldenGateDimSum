module Api
  class RegistrationsController < Devise::RegistrationsController
    include RegistrationsHelper

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


    # update, change delivery address, consider moving out the user info to its own table
  end
end

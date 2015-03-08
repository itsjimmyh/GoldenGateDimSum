module Api
  class SessionsController < Devise::SessionsController

  before_action :testing

  respond_to :json

  def testing
    p params
  end

  end
end

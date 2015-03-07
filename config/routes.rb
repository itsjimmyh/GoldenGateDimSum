Rails.application.routes.draw do

  root 'home#root'

  namespace :api, defaults: { format: :json } do

    devise_for :users, controllers: {

      registrations: 'api/registrations',
      sessions:      'api/sessions'
    }

  end
end

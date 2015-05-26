Rails.application.routes.draw do

  root 'home#root'

  namespace :api, defaults: { format: :json } do

    devise_for :users, controllers: {
      registrations: 'api/registrations',
      sessions:      'api/sessions'
    }

    resources :menu_items, only: [:new, :index, :create, :show, :destroy]

  end
end

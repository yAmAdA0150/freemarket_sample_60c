Rails.application.routes.draw do           
  devise_for :users

  root to: 'items#index'


  # devise_scope :user do
  #   get 'signin', to: 'devise/session#new', as: :new_user_session_signin
  #   post 'signin', to: 'devises/session#create',as: :user_session_signin
  #   delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session_signout

    # get 'signup/registration', to: 'devise/registrations#new', as: :new_user_registration_signup
    # patch 'users/password', to: 'devise/passwords#update'
    # put 'users/password', to: 'devise/passwords#update'
    # post 'users/password', to: 'devise/passwords#create'

  # end


  resources :items do
  end

  resources :signup ,only: [:index, :create] do
    collection do
      get 'index'
      get 'registration'
      get 'sms_confimation'
      get 'address'
      get 'creditcard'
      get 'complete'
    end
  end
end

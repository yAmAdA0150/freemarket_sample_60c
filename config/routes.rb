Rails.application.routes.draw do           
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'items#index'

  # resource :user, only: [:destroy]

  resources :categories, only: [:show, :index]

  resources :users, only: [:show, :edit, :destroy, :update] do
    member do
      get 'address'
      get 'signout'
    end
    resource :cards, only: [:new, :show] do
      collection do
        get 'create'
        get 'payment' => 'cards#payment'
        get 'delete'
      end
    end
    resources :items, only: [:new,:create, :edit,:update,:destroy] do
      member do
        get 'done'
        get 'confirmation' =>'items#confirmation'
        post 'confirmation' => 'items#buy'
      end
    end
  end

  resources :items, only: [:index, :show]do
    collection do
      get 'search'
    end
  end

  namespace :api do
    resources :categories, only: :index
  end

  resources :signup do 
    collection do
      get 'index'
      get 'registration'
      get 'sms_confirmation'
      get 'address'
      post 'signup' => 'signup#create'
      get 'creditcard'
      post 'payment' => 'signup#payment'
      get 'complete'
    end
  end

end

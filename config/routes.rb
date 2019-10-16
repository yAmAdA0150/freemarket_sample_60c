Rails.application.routes.draw do           
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'items#index'

  # resource :user, only: [:destroy]
  # まだテーブルにレコードがないが、ビューの作成のためにコメントアウトしてあります

  # resources :items, only: [:index, :show,] do
  #   resources :users do
  #     member do
  #       get 'buy'
  #     end
  #   end
  # end
  resources :categories, only: [:show, :index]
  resources :brands, only:[:show ,:index]
  
  
  resources :users, only: [:show, :edit, :destroy, :update] do
    resource :card, only: [:new, :show, :create, :edit, :update, :destroy] do
      get 'create'
      post 'payment' => 'card#payment'
    end
  end
  
  
  
  # resources :users do
  #   resources :items , only:[:edit, :update, :destroy, :new ,:create] do
  #     collection do
  #       get 'search'
  #     end
  #   end
    
    

    
    resources :addresses, only: [:update, :edit]
    
  # end

  # resources :card, only: [:new, :show] do
  #   collection do
  #     post 'show', to: 'card#show'
  #     post 'pay', to: 'card#pay'
  #     post 'delete', to: 'card#delete'
  #   end
  # end

  namespace :api do
    resources :categories, only: :index, defaults: { format: 'json' }
  end

  
  resources :items do
    collection do
      get 'buy'
      get 'show'
      get 'new'
      get 'edit'
      get 'search'
      get 'sell'
    end
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

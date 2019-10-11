Rails.application.routes.draw do           
  devise_for :users
  root to: 'items#index'

  # resources :items, only: [:index, :show,] do
  #   resources :users do
  #     member do
  #       get 'buy'
  #     end
  #   end
  # end
  resources :categories, only: [:show, :index]
  resources :brands, only:[:show ,:index]
  
  
  resources :users, only: [:show, :edit, :destroy, :update]
  # resources :users do

  #   resources :items , only:[:edit, :update, :destroy, :new ,:create] do
  #     collection do
  #       get 'search'
  #     end
  #   end
    
    resources :cards, only: [:new, :show, :create, :edit, :update, :destroy]
    
    resources :addresses, only: [:update, :edit]
    
  # end
  
  resources :items do
    collection do
      get 'buy'
      get 'show'
      get 'new'
      get 'edit'
      get 'search'
    end
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

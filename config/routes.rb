Rails.application.routes.draw do           
  devise_for :users

  resources :signup ,only: [:index, :create] do
    collection do
      get 'registration'
      post 'registration' 
      get 'sms'
      post 'sms' => 'signup#sms_post'
      get 'sms'
      post 'sms' => 'signup#sms_check'
      get 'address'
      post 'address'
      get 'creditcard'
      get 'done'
    end
  end
end

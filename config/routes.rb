AlugSeguro::Application.routes.draw do
  devise_for :users

  # match 'pages/term' => 'pages#term'
  match 'pages/index' => 'pages#index'

  resources :consoles

  resources :users

  resources :games do
    member do
      get 'rent'
      put 'rent_money'
      put 'rent_credit'
    end
  end
  
  resources :genders

  resources :histories

  resources :rents do
    member do
      put 'return_game'
      put 'confirm_devolution'
      put 'accept_rent'
    end
    collection do
      get 'admin'
      get 'devolution'
    end
  end

  root to: 'pages#index'

end

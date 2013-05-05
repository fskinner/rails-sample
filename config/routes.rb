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

  resources :rents do
    member do
      put 'return_game'
    end
  end

  resource :histories

  # resources :sales do
  #   member do
  #     put 'confirm'
  #   end
  # end

  # resources :trades do
  #   member do
  #     put 'accept'
  #     put 'decline'
  #   end
  # end

  # resources :announcements do
  #   member do
  #     put 'buy'
  #     put 'swap'
  #   end
  # end

  root to: 'pages#index'

end

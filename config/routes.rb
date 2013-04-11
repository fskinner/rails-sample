AlugSeguro::Application.routes.draw do
  devise_for :users

  # match 'pages/term' => 'pages#term'
  match 'pages/index' => 'pages#index'

  # resources :consoles

  resources :users

  # resources :games
  # resources :categories

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

Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :foods
  resources :recipes

  get '/general_shopping_list', to: 'foods#general'


  # Defines the root path route ("/")

end

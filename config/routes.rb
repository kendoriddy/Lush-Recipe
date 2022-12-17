Rails.application.routes.draw do
  devise_for :users
  root 'precipes#index'

  resources :foods
  resources :recipes do
    resources :recipe_foods
  end

  get '/general_shopping_list', to: 'foods#general', as: 'general'


  # Defines the root path route ("/")

end

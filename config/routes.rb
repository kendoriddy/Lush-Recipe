Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: [:index, :show, :create, :destroy] do
    resources :foods, only: [:index, :show, :create, :destroy]
    resources :recipes, only: [:index, :show, :create, :destroy]

  end

  # Defines the root path route ("/")

end

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :user, only: [:index, :show, :create, :destroy] do
    resources :food, only: [:index, :show, :create, :destroy]
    resources :recipe, only: [:index, :show, :create, :destroy]
  end

  # Defines the root path route ("/")
  root "users#index"
end

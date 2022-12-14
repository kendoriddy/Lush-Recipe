Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

<<<<<<< HEAD
    resources :foods
    resources :recipes
=======
  resources :foods
  resources :recipes
  

>>>>>>> 1c55234d82a45875783b356aa106db834fdce826

  # Defines the root path route ("/")

end

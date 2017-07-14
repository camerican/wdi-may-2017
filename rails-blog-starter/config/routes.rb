Rails.application.routes.draw do
  root 'home#index'
  # option 1 (home contoller)
  # post 'login' => 'home#login', as: 'login'
  # get 'logout' => 'home#logout', as: 'logout'
  # option 2
  post 'sessions' => 'sessions#create', as: 'login'
  delete 'sessions' => 'sessions#destroy', as: 'logout'
  resources :posts do
    resources :comments, only: [:create,:update,:destroy]
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

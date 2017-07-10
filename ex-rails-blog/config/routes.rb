Rails.application.routes.draw do
#  resources :users
  get '/' => 'home#index', as: 'home'

  get 'users' => 'users#index', as: 'users' #=> 'user#index'

  post 'users' => 'users#create'

  get 'users/new'

  get 'users/:id' => 'users#show', as: 'user'

  put 'users/:id' => 'users#update'





  get 'users/:id/edit' => 'users#edit', as: 'users_edit'


  get 'search' => 'home#search', as: 'search'

  post 'login' => 'session#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

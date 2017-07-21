Rails.application.routes.draw do
  resources :keywords
  resources :artworks
  resources :artists
  get 'search' => 'misc#search', as: :search
  patch 'artworks/:id/condition-upgrade' => 'artworks#upgrade', as: :artwork_upgrade
  patch 'artworks/:id/condition-downgrade' => 'artworks#downgrade', as: :artwork_downgrade
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

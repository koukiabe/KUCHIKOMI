Rails.application.routes.draw do
  root to: 'homepages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :edit, :create, :update]
  resources :spots, only: [:index, :show]
  resources :reviews, only: [:create, :destroy]
  resources :favorite_spots, only: [:create, :destroy]
end

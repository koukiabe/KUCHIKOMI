Rails.application.routes.draw do
  root to: 'users#show'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  get 'welcome', to: 'homepages#index', as: 'homepages'
  resources :users, only: [:show, :new, :edit, :create, :update]
  resources :spots, only: [:index, :show]
  resources :reviews, only: [:create, :destroy]
  resources :favorite_spots, only: [:create, :destroy]
end

Rails.application.routes.draw do
  root to: 'homepages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  get 'welcome', to: 'homepages#index', as: 'homepages'
  get 'rankings/good', to: 'rankings#good'
  get 'rankings/like', to: 'rankings#like'
  resources :users, only: [:show, :new, :edit, :create, :update] do
    member do
      get :contents
      get :goods
      get :likes
      get :refs
      get :evas
      get :nices
      get :cons
    end
  end
  resources :spots, only: [:index, :show]
  resources :restaurants, only: [:index, :show]
  resources :reviews, only: [:create, :destroy]
  resources :res_reviews, only: [:create, :destroy]
  resources :favorite_spots, only: [:create, :destroy]
  resources :favorite_restaurants, only: [:create, :destroy]
  resources :refs, only: [:create, :destroy]
  resources :evas, only: [:create, :destroy]
end

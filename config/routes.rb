Rails.application.routes.draw do
  root to: 'homepages#index'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :edit, :create, :update]
end

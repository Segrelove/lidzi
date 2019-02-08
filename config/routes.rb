Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'statics#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:index, :new, :create, :show]
end
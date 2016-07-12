Rails.application.routes.draw do
  
	resources :distances, only: [:new, :create]
  resources :places, only: [:index, :new, :create, :show]
  root 'places#index'
end

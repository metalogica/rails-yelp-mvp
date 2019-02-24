Rails.application.routes.draw do
  # get 'restaurants', to: 'restaurants#index', as: :restuarants
  # get 'restaurants/new', to: 'restaurants#new'
  # post 'restaurants', to: 'restaurants#create'
  # get 'restaurants/:id', to: 'restaurants#show', as: :restaurant

  # get 'restaurants/:restaurant_id/reviews/new', to: 'reviews#new', as: :reviews
  # post 'restaurants/:restaurant_id/reviews', to: 'reviews#create'
  root to: 'restaurants#index'

  resources :restaurants, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:new, :create]
  end
end

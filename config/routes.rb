Rails.application.routes.draw do
  resources :restaurant_pizzas
  resources :pizzas
  resources :restaurants
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

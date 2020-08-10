Rails.application.routes.draw do
  resources :items
  devise_for :accounts

  post 'items/add_to_cart/:id', to: 'items#add_to_cart', as: 'add_to_cart'
  delete 'items/remove_from_cart/:id', to: 'items#remove_from_cart', as: 'remove_from_cart'

  get '/cart_session', to: 'items#cart_session'

  root 'public#main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'account_wishlist_items/update'
  resources :items do
    # this was for the search feature that doesnt work atm.
    collection do
      get :search
    end
  end
  devise_for :accounts

  # post and delete requests for the shopping cart
  post 'items/add_to_cart/:id', to: 'items#add_to_cart', as: 'add_to_cart'
  delete 'items/remove_from_cart/:id', to: 'items#remove_from_cart', as: 'remove_from_cart'

  # Shopping Cart route
  get '/cart_session', to: 'items#cart_session'
  # Wishlist route
  get '/wishlist', to: 'account_wishlist_items#wishlist'

  root 'items#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

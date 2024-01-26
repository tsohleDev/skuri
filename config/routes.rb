Rails.application.routes.draw do
  get 'admin', to: 'admin#index'
  devise_for :users
  get 'home/index'
  get 'home/search'
  root 'home#index'

  resources :shipments

resources :users do
  resources :orders
  get 'wishlist', to: 'wishlists#show', on: :member, as: :wishlist
  get 'cart', to: 'carts#show', on: :member, as: :cart
end

  resources :products do
    resources :reviews
    post 'add_to_cart', to: 'carts#add_to_cart', on: :member, as: :add_to_cart
    post 'remove_from_cart', to: 'carts#remove_from_cart', on: :member, as: :remove_from_cart
    post 'add_to_wishlist', to: 'wishlists#add_to_wishlist', on: :member, as: :add_to_wishlist
  end

  resources :categories
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end

Rails.application.routes.draw do
  get 'help_messages/new'
  get 'help_messages/create'
  devise_for :users
  root 'home#index'

  #resources :shipments
  resources :help_messages, only: [:new, :create]

  resources :users do
    get 'wishlist', to: 'wishlists#show', on: :member, as: :wishlist
    get 'cart', to: 'carts#show', on: :member, as: :cart
    resources :carts, only: [:show] do
      # increment_quantity and decrement_quantity are custom methods that include product_id
      post 'increment_quantity/:product_id', to: 'carts#increment_quantity', on: :member, as: :increment_quantity
      post 'decrement_quantity/:product_id', to: 'carts#decrement_quantity', on: :member, as: :decrement_quantity
      post 'checkout', to: 'carts#checkout', on: :member, as: :checkout
    end

    post 'orders', to: 'users#orders', on: :member, as: :orders
    post 'returns', to: 'users#returns', on: :member, as: :returns
    post 'returnables', to: 'users#returnables', on: :member, as: :returnables
    post 'help', to: 'users#help', on: :member, as: :help
    # For payfast payment gateway integration
    get 'success', to: 'users#success', on: :member, as: :success
  end

  resources :products do
    resources :reviews
    post 'add_to_cart', to: 'carts#add_to_cart', on: :member, as: :add_to_cart
    post 'remove_from_cart', to: 'carts#remove_from_cart', on: :member, as: :remove_from_cart
    post 'add_to_wishlist', to: 'wishlists#add_to_wishlist', on: :member, as: :add_to_wishlist
  end

  #resources :categories

  get 'admin', to: 'admin#index', as: :admin

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end

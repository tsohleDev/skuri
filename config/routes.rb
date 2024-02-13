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
    post 'cancel', to: 'users#cancel', on: :member, as: :cancel_return
    post 'return', to: 'users#return', on: :member, as: :return
    post 'exchange', to: 'users#exchange', on: :member, as: :exchange
    get 'success', to: 'users#success', on: :member, as: :success
  end

  resources :products, only: [:index, :show] do
    resources :reviews
    post 'add_to_cart', to: 'carts#add_to_cart', on: :member, as: :add_to_cart
    post 'remove_from_cart', to: 'carts#remove_from_cart', on: :member, as: :remove_from_cart
    post 'add_to_wishlist', to: 'wishlists#add_to_wishlist', on: :member, as: :add_to_wishlist
  end

  #resources :categories
  get 'admin', to: 'admin#index', as: :admin

  # GET
  post 'admin/orders', to: 'admin#orders', as: :admin_orders
  post 'admin/products', to: 'admin#products', as: :admin_products
  post 'admin/categories', to: 'admin#categories', as: :admin_categories
  post 'admin/messages', to: 'admin#messages', as: :admin_messages
  post 'admin/shipments', to: 'admin#shipments', as: :admin_shipments

  # Manage
  post 'admin/manage_order', to: 'admin#manage_order', as: :manage_order
  post 'admin/shipped_products', to: 'admin#ship_products', as: :ship_products
  post 'admin/exchanged_products', to: 'admin#exchange_products', as: :exchange_products
  post 'admin/refund_customer', to: 'admin#refund_customer', as: :refund_customer
  post 'admin/collect_products', to: 'admin#collect_products', as: :collect_products

  # EDIT
  post 'admin/edit_product', to: 'admin#edit_product', as: :edit_product
  post 'admin/edit_order', to: 'admin#edit_order', as: :edit_order

  # DELETE
  delete 'admin/delete_product', to: 'admin#delete_product', as: :delete_product

  # PATCH
  patch 'admin/update_product', to: 'admin#update_product', as: :update_product
  patch 'admin/update_category', to: 'admin#update_category', as: :update_category
  patch 'admin/update_shipment', to: 'admin#update_shipment', as: :update_shipment
  
  # NEW
  post 'admin/new_product', to: 'admin#new_product', as: :new_product

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end

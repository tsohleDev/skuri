Rails.application.routes.draw do
  get 'admin/index'
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :products, only: [:index, :show] do
    post 'search', to: 'products#search', on: :collection, as: :search
    post 'change_colour', to: 'products#change_colour', on: :member, as: :change_colour
    post 'review', to: 'products#review', on: :member, as: :review
  end 

  resources :users, only: [:show, :edit] do
    #cart
    resources :cart, only: [:index]

    resources :wishlist, only: [:index]

    post 'orders', to: 'users#orders', on: :member, as: :orders
    post 'returns', to: 'users#returns', on: :member, as: :returns
    post 'returnables', to: 'users#returnables', on: :member, as: :returnables
    post 'help', to: 'users#help', on: :member, as: :help
    post 'help_messages', to: 'users#help_messages', on: :member, as: :help_messages
    # For payfast payment gateway integration
    post 'cancel', to: 'users#cancel', on: :member, as: :cancel_return
    post 'return', to: 'users#return', on: :member, as: :return
    post 'exchange', to: 'users#exchange', on: :member, as: :exchange
    get 'success', to: 'users#success', on: :member, as: :success
  end
  # Cart actions
  post "cart/add", to: "cart#add", as: :cart_add
  post "cart/inrement", to: "cart#increment", as: :cart_increment
  post "cart/decrement", to: "cart#decrement", as: :cart_decrement
  delete "cart/remove", to: "cart#remove", as: :cart_remove

  # Wishlist actions
  post "wishlist/add", to: "wishlist#add", as: :wishlist_add
  delete "wishlist/remove", to: "wishlist#remove", as: :wishlist_remove

  # Admin actions
  get "admin", to: "admin#index", as: :admin

  post 'admin/orders', to: 'admin#orders', as: :admin_orders
  post 'admin/products', to: 'admin#products', as: :admin_products
  post 'admin/categories', to: 'admin#categories', as: :admin_categories
  post 'admin/messages', to: 'admin#messages', as: :admin_messages
  post 'admin/shipments', to: 'admin#shipments', as: :admin_shipments

  # NEW
  post 'admin/new_product', to: 'admin#new_product', as: :new_product
  post 'admin/create_product', to: 'admin#create_product', as: :create_product
  post 'admin/new_category', to: 'admin#new_category', as: :new_category
  post 'admin/new_color', to: 'admin#new_color', as: :new_color
  post 'admin/create_category', to: 'admin#create_category', as: :create_category
  post 'admin/create_color', to: 'admin#create_color', as: :create_color

  # Manage
  post 'admin/manage_order', to: 'admin#manage_order', as: :manage_order
  post 'admin/shipped_products', to: 'admin#ship_products', as: :ship_products
  post 'admin/exchanged_products', to: 'admin#exchange_products', as: :exchange_products
  post 'admin/refund_customer', to: 'admin#refund_customer', as: :refund_customer
  post 'admin/collect_products', to: 'admin#collect_products', as: :collect_products

  # EDIT
  post 'admin/edit_product', to: 'admin#edit_product', as: :edit_product
  post 'admin/edit_order', to: 'admin#edit_order', as: :edit_order

  # PATCH
  post 'admin/update_product', to: 'admin#update_product', as: :update_product
  patch 'admin/update_category', to: 'admin#update_category', as: :update_category
  patch 'admin/update_shipment', to: 'admin#update_shipment', as: :update_shipment

  # DELETE
  delete 'admin/delete_product', to: 'admin#delete_product', as: :delete_product

  # Defines the root path route ("/")
  root "home#index"
end

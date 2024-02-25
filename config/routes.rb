Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :products, only: [:index, :show]

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
  delete "cart/remove", to: "cart#remove", as: :cart_remove

  # Wishlist actions
  post "wishlist/add", to: "wishlist#add", as: :wishlist_add
  delete "wishlist/remove", to: "wishlist#remove", as: :wishlist_remove

  # Defines the root path route ("/")
  root "home#index"
end

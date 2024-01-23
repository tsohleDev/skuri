Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home/search'
  root 'home#index'

  resources :shipments

  resources :users do
    resources :orders
    get ':wishlist', to: 'customers#wish_list'
    get ':cart', to: 'customers#cart'
  end


  resources :products do
    resources :reviews
  end

  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

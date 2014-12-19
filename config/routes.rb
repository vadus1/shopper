Shopper::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)

  namespace :cart do
    resources :users do
      resources :addresses, only: :index
    end
  end

  resources :categories, only: :index do
    resources :products, only: :show
  end

  resources :products, only: :show do
    resources :items, only: :create
  end

  resources :orders, only: [:show, :index] do
    get ":id/status/:status", action: :show, as: :status, on: :collection
  end

  resources :carts, only: [:show, :edit, :update] do
    resources :addresses, only: [:new, :create]
  end

  resources :items, only: [:create, :update, :destroy]
  resources :addresses, except: [:show, :index]
  resources :users do
    resources :orders,    only: [:show, :index]
    resources :addresses, except: [:show, :index]
  end

  resources :guests, only: [:new, :create, :update]

  root to: 'home#index'
  get 'delivery',           controller: :pages, action: :delivery
  get 'contacts',           controller: :pages, action: :contacts
  get 'useful-information', controller: :pages, action: :useful_information, as: :useful_information
  get 'catalog',            controller: :pages, action: :catalog
end

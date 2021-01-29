Rails.application.routes.draw do
  root "products#index", as: "home"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "/pages/:page" => "pages#show", as: 'page'
  resources :categories, only: :show  do
    resources :products do
      get "search", on: :collection
    end
  end

  resources :products, only: [:search, :index, :show] do
    get "search", on: :collection
  end

  resources :products do
    resources :order_items, only: [:create, :update, :destroy]
  end

  get 'orders/complete'
  resources :orders, only: :show do
  end

  resources :order_items do
    member do
      get 'increase_quantity'
      get 'decrease_quantity'
    end
  end

  resources :comments

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

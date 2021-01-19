Rails.application.routes.draw do
  get 'order/show'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "products#index", as: "home"
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

  resources :order, only: :show do
  end

  resources :order_items do
    member do
      get 'increase_quantity'
      get 'decrease_quantity'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

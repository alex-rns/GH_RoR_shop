Rails.application.routes.draw do
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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

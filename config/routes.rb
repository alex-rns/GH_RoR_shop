Rails.application.routes.draw do
  root "products#index", as: "home"
  get "/pages/:page" => "pages#show", as: 'page'
  resources :categories do
    resources :products do
      get "search", on: :collection
    end
  end

  resources :products, only: [:search, :index, :show] do
    get "search", on: :collection
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

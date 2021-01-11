Rails.application.routes.draw do
  root "pages#home", as: "home"
  resources :categories, only: :show do
    resources :products, only: [:index, :show]
  end

  resources :products, only: [:search] do
    get "search", on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :users
  resources :plans
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "plans#index"
end

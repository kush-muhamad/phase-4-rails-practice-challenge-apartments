Rails.application.routes.draw do
  resources :leases, only: [ :create, :destroy]
  resources :tenants, only: [:index, :update, :create, :destroy]
  resources :apartments , only: [:index, :update, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

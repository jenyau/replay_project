Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :users do
    resources :tickets, shallow: true
  end
  resources :trains do
    resources :carriages, shallow: true
    resources :coupe_carriages, shallow: true
    resources :economy_carriages, shallow: true
    resources :sv_carriages, shallow: true
    resources :seats_carriages, shallow: true
  end
  resources :routes
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time_position, on: :member
  end
  resource :search, only: [:new, :show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

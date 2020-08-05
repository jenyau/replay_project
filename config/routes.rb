Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
      resources :coupe_carriages, shallow: true
      resources :economy_carriages, shallow: true
      resources :sv_carriages, shallow: true
      resources :seats_carriages, shallow: true
    end
    resources :tickets
    resources :routes
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time_position, on: :member
    end
  end

  resources :users do
    resources :tickets, shallow: true
  end

  resource :search, only: [:new, :show, :create]
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  resources :tickets
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
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

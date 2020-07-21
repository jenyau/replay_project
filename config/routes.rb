Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  resources :tickets
  resources :trains
  resources :carriages
  resources :coupe_carriages
  resources :economy_carriages
  resources :sv_carriages
  resources :seats_carriages
  resources :routes
  resources :railway_stations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

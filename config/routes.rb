Rails.application.routes.draw do
  root 'flight_search#new'
  resources :flight_search, only: [:new, :create]

  get 'flight/:ident', to: 'flight#show', as: 'flight'

  # Services
  get 'services/apple_maps_token', to: 'services#apple_maps_token'
end

Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  get 'flight/:ident', to: 'flight#show', as: 'flight'

  # Services
  get 'services/apple_maps_token', to: 'services#apple_maps_token'
end

Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  get 'flight/:ident', to: 'flight#show', as: 'flight'
end

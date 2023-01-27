Rails.application.routes.draw do
  resources :home, only: %i[index]
  resources :alcohols

  root 'home#index'
end

Rails.application.routes.draw do
  get '/submit', to: 'badges#new'
  get '/success', to: 'badges#show'

  resources :badges, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

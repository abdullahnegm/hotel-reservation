Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'sessions#create'
  
  namespace :admin do
    post '/users', to: 'users#create'
    post '/rooms', to: 'rooms#create'
    post '/reservations', to: 'reservations#create'
  end

  namespace :user do
    post '/reservations', to: 'reservations#create'
    delete '/reservations', to: 'reservations#destroy'
  end
end

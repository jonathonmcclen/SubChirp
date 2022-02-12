Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, shallow: true do 
    resources :chirps, shallow: true
  end
  
  resources :sessions, only: [:create]

  get '/', to: 'application#home_login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#clear'

  post '/chirps', to: 'chirps#create'
  get '/chirps/:id', to: 'chirps#show'

  #get '/users/:user_id/chirps/private', to: ''
  #get '/users/:user_id/chirps/', to: ''

  get '/auth/:provider/callback', to: 'sessions#create_session_omniauth'
  get '/users/:id/privatechirps', to: 'users#private'

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, shallow: true

  resources :chirps, shallow: true do 
    resources :guesses, shallow: true 
  end 
  
  resources :sessions, only: [:create]

  get '/', to: 'application#home_login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#clear'

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, shallow: true
  resources :chirps, shallow: true
  resources :guesses, shallow: true 

  get '/', to: 'application#home_login'
  post '/login', to: 'sessions#login'

end

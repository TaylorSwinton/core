Rails.application.routes.draw do
  resources :courses
  resources :actions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#home'

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

# Third party login
  get '/auth/facebook/callback' => 'sessions#fbcreate'
end

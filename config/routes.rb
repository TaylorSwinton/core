Rails.application.routes.draw do
  resources :courses 
  resources :steps
  resources :users

#Nested Routes
 resources :courses do
    resources :steps, only: [:create, :new, :index, :show]
 end

 resources :users do
    resources :courses, only: [:index]
 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #Login/Signup Routes Here
  root 'sessions#home'

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

# Third party login
  get '/auth/facebook/callback' => 'sessions#fbcreate'
end

Rails.application.routes.draw do
  # resources :posts
  # resources :users
  get '/', to: 'users#index'
  post '/users', to: 'users#create'
  get '/me',to: 'users#show'
  delete '/users/:id', to: 'users#destroy'
  ##Posts
  get '/posts', to: 'posts#index'
  post '/posts', to: 'posts#create'
  patch '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy'

  ##Sessions
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

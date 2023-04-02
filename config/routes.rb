Rails.application.routes.draw do
  # resources :posts
  # resources :users
  get '/', to: 'users#index'
  post '/users', to: 'users#create'
  ##Posts
  get '/posts', to: 'posts#index'
  post '/posts', to: 'posts#create'
  post '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

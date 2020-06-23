Rails.application.routes.draw do

  root :to => 'pages#home'
  
  resources :users, :only => [:new, :create]
  resources :todo_lists
  resources :tasks

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end

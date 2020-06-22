Rails.application.routes.draw do

  get 'pages/home'
  root :to => 'pages#home'
  
  resources :users, :only => [:new, :create]
  resources :todo_list
  resources :tasks

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end

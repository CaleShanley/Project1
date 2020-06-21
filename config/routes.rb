Rails.application.routes.draw do

  root :to => 'session#new'
  
  resources :users, :only => [:new, :create]
  resources :todo_list
  resources :todo_item

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end

Rails.application.routes.draw do
  root :to => "todo_lists#index"

  resources :users, :only => [:new, :create]
  resources :todo_lists
  resources :tasks

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"

  get "/tasks/:id/edit" => "tasks#edit"
  post "/tasks/:id" => "tasks#complete"

  delete "/todo_lists" => "todo_lists#destroy"
end

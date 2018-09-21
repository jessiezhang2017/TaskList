Rails.application.routes.draw do
  root"tasks#index"

  # resources :tasks

  get '/tasks', to: 'tasks#index', as: 'tasks'

  get 'tasks/new', to: 'tasks#new', as: 'new_task'
  post 'tasks', to: 'tasks#create'

  patch 'tasks/:id', to: 'tasks#update'
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'

  patch 'tasks/:id/complete', to: 'tasks#mark_complete', as: 'mark_complete'

  put '/tasks/:id', to: 'tasks#update'
  get '/tasks/:id', to: 'tasks#show', as: 'task'
  delete '/tasks/:id', to: 'tasks#destroy'


end

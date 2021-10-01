Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  post 'sessions/destroy', as: 'session_destroy'

  resources :stories
  resources :users, only: [:new, :create, :show]
  root 'stories#index'
  post 'users/destroy_session', as: 'destroy_session'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

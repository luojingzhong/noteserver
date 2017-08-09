Noteserver::Application.routes.draw do
  root 'sessions#new'
  resources :users,         only: [:create,:new]
  resources :sessions,      only: [:new, :create, :destroy]
end

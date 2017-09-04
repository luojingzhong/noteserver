Noteserver::Application.routes.draw do
  root 'sessions#new'
  resources :users,         only: [:create,:new,:edit,:update,:show]
  resources :sessions,      only: [:new, :create, :destroy]
  resources :notebooks,		only: [:create,:destroy,:update]
end

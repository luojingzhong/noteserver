Noteserver::Application.routes.draw do
  root 'sessions#new'
  resources :users,         only: [:create,:new,:edit,:update]
  resources :sessions,      only: [:new, :create, :destroy]
end

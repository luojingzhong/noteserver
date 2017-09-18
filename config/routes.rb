Noteserver::Application.routes.draw do
  root 'sessions#new'
  resources :users,         only: [:create,:new,:edit,:update,:show] do
    member do
      get :notes
    end
  end
  resources :sessions,      only: [:new, :create, :destroy]
  resources :notebooks,     only: [:create,:destroy,:update]
  resources :notes,         only: [:index,:create,:destroy,:update,:edit] do
    collection do
      get :search
    end
  end
  resources :shares do
    collection do
      get :load_more
      get :search
    end
    member do
      post :collection
    end
  end
end

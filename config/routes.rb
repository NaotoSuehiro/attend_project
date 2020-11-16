Rails.application.routes.draw do
  # root to: 'toppages#index'For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  
  resources :users, only: [:index, :show, :new, :create] 
  resources :users do
  get :search, on: :collection
  end
  
  resources :lectures do
    resources :bookmarks, only: [:create, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :messages, only: [:create, :destroy]
  resources :accounts, only: [:new, :create]
end

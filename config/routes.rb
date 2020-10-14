Rails.application.routes.draw do
  # root to: 'toppages#index'For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
 
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  resources :users, only: [:index, :show, :new, :create]
  resources :professors,only: [:index, :show, :new, :create]
  resources :lectures
  resources :sessions, only: [:new, :create, :destroy]
  resources :sessions_professor, only: [:new, :create, :destroy]
  resources :posting, only: [:show, :new, :cereate, :edit, :destroy]
  get "new_session", to: "professors#new"
  
end

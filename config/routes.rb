Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions do
    resources :answers, only: [:create]
  end
  resources :answers, only: [:edit, :update, :destroy]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :destroy]

  post 'sessions/login', to: 'sessions#login'

end

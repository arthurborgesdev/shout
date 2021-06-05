Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  resources :followings
  resources :yells
  resources :users
  resources :logins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#welcome"
  post "user/login", to: 'users#login'
  post "user/logout", to: 'users#logout'
end

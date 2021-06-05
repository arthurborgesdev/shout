Rails.application.routes.draw do
  resources :followings
  resources :yells
  resources :users
  resources :logins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#new"
  post "user/login", to: 'users#login'
  post "user/logout", to: 'users#logout'
end

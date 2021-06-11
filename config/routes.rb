Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  resources :yells, except: [:show, :edit, :update]
  resources :users, except: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sessions#welcome"

  get 'homepage', to: 'homepage#index'

  get 'follow/:id', to: 'users#follow', as: 'user_follow'
  get 'unfollow/:id', to: 'users#unfollow', as: 'user_unfollow'
end

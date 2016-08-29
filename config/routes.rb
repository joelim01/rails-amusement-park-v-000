Rails.application.routes.draw do


  resources :attractions
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:destroy, :create]
  resources :rides, only: [:create]
  get "/signin", to: "sessions#new"
  get "/signout", to: "sessions#destroy"



  root "application#welcome"

end

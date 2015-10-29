Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/github', as: :login
  get '/auth/github/callback' => 'sessions#create'
  get "/logout" => 'sessions#destroy'

  resources :repos, only: [:index]
  resources :pullrequests, only: [:index]
  resources :followers, only: [:index]
  resources :organizations, only: [:index]
end

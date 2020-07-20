Rails.application.routes.draw do
  
  get "/about"=>"home#about"
  root 'home#top'
  resources :users
  get "login"=>'sessions#new'
  post "login" =>"sessions#create"
  post "logout" => "sessions#destroy"

  get "signup"=>'users#new'

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  get "users/:id" => "users#show"
  post "users/create"=>"users#create"
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
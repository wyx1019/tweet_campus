Rails.application.routes.draw do
  get "login"=>'sessions#new'
  post "login" =>"sessions#create"
  post "logout" => "sessions#destroy"

  resources :microposts

  resources :users do
    get :search, on: :collection
  end
  get "signup"=>'users#new'
  resources :users

  get "about"=>"home#about"
  root 'home#top'
  
end
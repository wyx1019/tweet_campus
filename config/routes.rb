Rails.application.routes.draw do
  get "login"=>'sessions#new'
  post "login" =>"sessions#create"
  post "logout" => "sessions#destroy"
  get "signup"=>'users#new'

  resources :microposts

  resources :users do
    collection do
      get :search
    end
  end

  resources :relationships, only: [:create, :destroy]

  get "about"=>"home#about"
  root 'home#top'
  
end
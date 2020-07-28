Rails.application.routes.draw do
  get "login"=>'sessions#new'
  post "login" =>"sessions#create"
  post "logout" => "sessions#destroy"

  resources :microposts

  resources :users do
    collection do
      get :search
    end
  end
  get "signup"=>'users#new'

  get "about"=>"home#about"
  root 'home#top'
  
end
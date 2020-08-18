Rails.application.routes.draw do
  get "login"=>'sessions#new'
  post "login" =>"sessions#create"
  post "logout" => "sessions#destroy"
  get "signup"=>'users#new'

  resources :microposts do
    collection do
      get :search
    end
    resources :comments, only: [:create, :show, :destroy] do
      resources :replies, only: [:create, :destroy]
    end
  end


  resources :users do
    collection do
      get :search
    end
    member do
      get :following, :followers
    end
  end

  resources :likes, only: [:create, :destroy]

  resources :relationships, only: [:create, :destroy]

  get "about"=>"home#about"
  get "schedule"=>"home#schedule"
  root 'home#top'
  
end
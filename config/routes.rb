Rails.application.routes.draw do

  post "users/:id/update" => "users#update"
  get "/users/:id/edit" => "users#edit"
  get "/users/:id" => "users#my_page"
  post "/users/create"=>"users#create"
  get "/signup"=>'users#new'

  get "/about"=>"home#about"
  root 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
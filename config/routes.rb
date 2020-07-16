Rails.application.routes.draw do
  get "/signup"=>'users#new'
  get "/about"=>"home#about"
  root 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
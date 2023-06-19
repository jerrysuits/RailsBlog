Rails.application.routes.draw do
  # resources :posts
  
  get "/post", to:"posts#index"
  # get "/post/:id", to:"post#show"
  # get "/post/new", to:"post#new"
  # post "/post", to:"post#create"
  # delete "/post/:id", to:"post#destroy"
  # patch "/post/:id", to:"post#update"


end

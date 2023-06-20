Rails.application.routes.draw do
  resources :posts, only: [:index, :show,:create,:update,:destroy]

  # get "/singlepost/:id", to:"posts#getSinglePost"

  # get "/post", to:"posts#index"
  # get "/post/:id", to:"post#show"
  # post "/post", to:"post#create"
  # delete "/post/:id", to:"post#destroy"
  # patch "/post/:id", to:"post#update"


end

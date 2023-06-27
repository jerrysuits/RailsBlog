Rails.application.routes.draw do
  resources :users
  resources :posts, only: [:index, :show,:create,:update,:destroy]

  patch "/posts/archive/:id", to:"posts#archive"

  # get "/post", to:"posts#index"
  # get "/post/:id", to:"post#show"
  # post "/post", to:"post#create"
  # delete "/post/:id", to:"post#destroy"
  # patch "/post/:id", to:"post#update"


end

Rails.application.routes.draw do
  post "/api/login", to:"session#login"
  delete "/api/logout", to:"session#logout"

  resources :users
  get "/api/current_user", to:"users#loggedin_user"

  
  resources :posts, only: [:index, :show,:create,:update,:destroy]
  get "/api/approvedposts", to:"posts#approvedposts"

  patch "/api/posts/archive/:id", to:"posts#archive"
  patch "/api/posts/approve/:id", to:"posts#approve"


  # get "/post", to:"posts#index"
  # get "/post/:id", to:"post#show"
  # post "/post", to:"post#create"
  # delete "/post/:id", to:"post#destroy"
  # patch "/post/:id", to:"post#update"


end

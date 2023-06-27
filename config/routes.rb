Rails.application.routes.draw do
  post "/login", to:"session#login"
  delete "/logout", to:"session#logout"

  resources :users
  get "/current_user", to:"users#loggedin_user"

  
  resources :posts, only: [:index, :show,:create,:update,:destroy]
  get "/approvedposts", to:"posts#approvedposts"

  patch "/posts/archive/:id", to:"posts#archive"
  patch "/posts/approve/:id", to:"posts#approve"


  # get "/post", to:"posts#index"
  # get "/post/:id", to:"post#show"
  # post "/post", to:"post#create"
  # delete "/post/:id", to:"post#destroy"
  # patch "/post/:id", to:"post#update"


end

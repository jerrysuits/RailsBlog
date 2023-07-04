Rails.application.routes.draw do
  # React routes
  # get "*path", to: "react#index", constraints: ->(req) { !req.xhr? && req.format.html? }
  post "/api/login", to:"session#login"
  delete "/api/logout", to:"session#logout"

  get "/api/current_user", to:"users#loggedin_user"

  scope "api" do
    resources :users
    resources :posts, only: [:index, :show,:create,:update,:destroy]
  end

  get "/api/approvedposts", to:"posts#approvedposts"
  patch "/api/posts/archive/:id", to:"posts#archive"
  patch "/api/posts/approve/:id", to:"posts#approve"


  get "*path", to:"react#index"


end

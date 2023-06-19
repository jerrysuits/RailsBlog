class PostsController < ApplicationController
    def index
        render json: {posts: "Post"}
    end
end

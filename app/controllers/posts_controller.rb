class PostsController < ApplicationController
    # All posts
    def index
        posts = Post.all
        render json: {posts: posts}
    end

    # Get Single Post
    def show
        post = Post.find_by(id: params[:id]) #value or null
        if post
            render json: post
        else
            render json: {error: "Post not found"}, status: :not_found

        end
    
    end 

    # Add new post
    def create
        # Assignment ensure that the title is unique
        post = Post.create(title: params[:articletitle],content: params[:content], username: params[:author] )
        render json: post, status: :created
    end

    # Update post
    def update
        post = Post.find_by(id: params[:id]) #value or null

        if post
            post.update(title: params[:articletitle],content: params[:content], username: params[:author] )
            # render json: post, status: :created
            render json: {success: "Post updated successfully"}, status: :created

        else
            render json: {error: "Post not found"}, status: :not_found
        end
    end

    # Update post
    def destroy
        post = Post.find_by(id: params[:id]) #value or null

        if post
            post.destroy
            render json: {success: "Post deleted successfully"}, status: :created

        else
            render json: {error: "Post you are trying to delete does not exist"}, status: :not_found
        end
    end
    

end

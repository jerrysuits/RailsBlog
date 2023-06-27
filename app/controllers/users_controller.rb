class UsersController < ApplicationController
     # All users
     def index
        users = User.all
        render json: users
        #  {users: users}
    end

    # Get Single User
    def show
        user = User.find_by(id: params[:id]) #value or null
        if user
            render json: user
            
        else
            render json: {error: "User not found"}, status: :not_found

        end
    
    end 

    # Add new user
    def create
        user = User.create(username: params[:username],email: params[:email], profile_image: params[:profile_image], password: params[:password] )
        if user.valid?
            render json: {success: "User created successfully"}, status: :created

        else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity

        end
 


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

     # Archive post
     def archive
        post = Post.find_by(id: params[:id]) #value or null

        if post
            post.delete_after_sometime
            render json: {success: "Post archived successfully! It will be deleted in the next 20seconds"}, status: :created

        else
            render json: {error: "Post not found"}, status: :not_found
        end
    end

    # Delete post
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

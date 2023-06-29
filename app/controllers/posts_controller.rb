class PostsController < ApplicationController
    skip_before_action :authorize, only: [:index, :show]
    # All posts
    def index
        posts = Post.all
        render json: posts.as_json(include: :user,except: [:password_digest])
    end

    # Get approved post
    def approvedposts
        posts = Post.where(is_approved: true)
        render json: posts.as_json(include: :user)
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
        post = @current_user.posts.create(title: params[:articletitle],content: params[:content] )
        if post.valid?
            # post = Post.create(title: params[:articletitle],content: params[:content], username: params[:author] )
            # render json: post, status: :created
            render json: {success: "Post added successfully"}, status: :created

        else
            render json: {error: post.errors.full_messages}, status: :unprocessable_entity

        end

    end

    # Update post
    def update
        post = Post.find_by(id: params[:id]) #value or null

        if post
            post.update(title: params[:articletitle],content: params[:content] )
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


         # Approve post / should be performed by admins only
         def approve
            current_user=User.find_by(id: session[:user_id])
            if current_user.is_admin==true
                post = Post.find_by(id: params[:id]) #value or null
    
                if post
                    post.update(is_approved: true)
                    render json: {success: "Post Approved... Can be seen by users"}, status: :created
        
                else
                    render json: {error: "Post not found"}, status: :not_found
                end
            else
                render json: {error: "Admins can only perform such operation"}, status: :not_found

               
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

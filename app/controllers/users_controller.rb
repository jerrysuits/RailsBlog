class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def loggedin_user
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json: {error: "Not logged in"}, status: :not_found
        end        

    end

 
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
        # is_admin: true, 
        user = User.create(username: params[:username],email: params[:email], profile_image: params[:profile_image], password: params[:password] )
        if user.valid?
            render json: {success: "User created successfully"}, status: :created

        else
            render json: {error: user.errors.full_messages}, status: :unprocessable_entity

        end
 


    end

   
    
end

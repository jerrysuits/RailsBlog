class SessionController < ApplicationController
    skip_before_action :authorize, only: [:login]

    def login 
        username = params[:username]
        password = params[:password]
        
        user = User.find_by(username: username)

        if user && user.authenticate(password)
            session[:user_id]=user.id

            render json: {success: "Login success"}
        else
            render json: {error: "Wrong username/password"}

        end
    end 


    def logout
       session.delete :user_id
       render json: {success: "Logout success"}

    end


end

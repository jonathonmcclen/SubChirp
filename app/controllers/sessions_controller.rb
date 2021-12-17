class SessionsController < ApplicationController

    def login

        @user = User.find_by(username: params[:user][:username])

        byebug

        if  params[:user][:password] == @user.password
            session[:id] = @user.id
            session[:username] = @user.username
            redirect_to user_path(@user)
        else 
            params[:message] = "So Sorry but we cant locate that username/email and password combination"
            redirect_to
        end 
    end 
    
end 

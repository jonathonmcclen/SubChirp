class SessionsController < ApplicationController

    def login

        @user = User.find_by(username: params[:user][:username])

        if  params[:user][:password] == @user.password
            session[:id] = @user.id
            session[:username] = @user.username
            redirect_to user_path(@user)
        else 
            
        end 
    end 

    def create 
        user = nil

        if params[:user][:username].include?("@")
            user = User.find_by(email: params[:user][:username]).try(:authenticate, params[:user][:password])
            byebug
        else 
            user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
            byebug
        end 
        

        if user
            session[:user_id] = user.id
            session[:username] = user.username
            session[:status] = "created"
            session[:logged_in] = true

            redirect_to user_path(user)
        else
            params[:message] = "So Sorry but we cant locate that username/email and password combination"
            redirect_to '/'
        end 
    end 

    def clear
        session.clear
        render :'/application/login'
    end 
    
end 

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
    def render_fail
        params[:message] = "So Sorry but we cant locate that username/email and password combination"
        redirect_to '/'
    end 

    def create 
        if params[:user][:username].include?("@")
            user = User.find_by(email: params[:user][:username])
            
            if user.try(:authenticate, params[:user][:password])
                session[:id] = user.id
                session[:username] = user.username
                session[:status] = "created"
                session[:logged_in] = true
                redirect_to user_path(user)
            else 
                render_fail()
            end 
        else 
            user = User.find_by(username: params[:user][:username])
            if user.try(:authenticate, params[:user][:password])
                session[:id] = user.id
                session[:username] = user.username
                session[:status] = "created"
                session[:logged_in] = true
                redirect_to user_path(user)
            else 
                render_fail()
            end 
        end
    end 

    def create_session_omniauth
        @user =
            User.find_or_create_by(uid: auth['uid']) do |u|
                #byebug
                u.username = auth['info']['name']
                u.email = auth['info']['email']
                u.password = SecureRandom.hex(12)
            end

        session[:id] = @user.id
        #byebug
        redirect_to @user
    end 

    def clear
        session.clear
        redirect_to '/'
    end 

    private

    def auth
        request.env['omniauth.auth']
    end

end 

class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        #byebug
        render :profile
    end

    def new
        @user = User.new
        render :create_user
    end

    def create
        @user = User.new
        @user.username = params[:user][:username]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password]

        if @user.valid?
            @user.save
            redirect_to '/'
        else 
            render :create_user
        end 
    end 

    def private
        @user = User.find(session[:id])
        @chirps = @user.chirps.setto_private
        render :private_chirps
    end  
    
    def all_users
        @users = User.all
        render :all_users
    end 

    
end

class UsersController < ApplicationController

    def show
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

        if @user.valid?
            @user.save
            redirect_to :'/application/login'
        else 
            render :create_user
        end 
    end 
    
end

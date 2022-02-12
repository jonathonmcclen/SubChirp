class ApplicationController < ActionController::Base

    before_action :get_logged_user

    def get_logged_user
        session[:id] ? @logged_user = User.find(session[:id]) : false
    end 

    def home_login
        if session
            #redirect_to :"/user/#{session[:id]}"
        else
            
        end 
        render :login
    end
end

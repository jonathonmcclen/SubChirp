class ApplicationController < ActionController::Base

    def home_login
        if session
            #redirect_to :"/user/#{session[:id]}"
        else
            
        end 
        render :login
    end




    
end

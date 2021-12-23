class ChirpsController < ApplicationController

    def view
        @chirp = Chirp.find(params[:id])
        render chirp_path(@chirp)
    end
    
    def new
        if session[:id]
            render :create_chirp
        else 
            redirect_to "/"
        end 
    end

    def create

    end

end 
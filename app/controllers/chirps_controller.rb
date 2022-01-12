class ChirpsController < ApplicationController

    def show
        @chirp = Chirp.find(params[:id])
        render chirp_path(@chirp)
    end

    def index
        
    end
    
    def new
        @chirp = Chirp.new
        
        if session[:id]
            render :create_chirp
        else 
            redirect_to "/"
        end 
    end

    def create

    end



end 
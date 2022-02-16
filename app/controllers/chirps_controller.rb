class ChirpsController < ApplicationController

    def show
        @chirp = Chirp.find(params[:id])

        if session[:id] == @chirp.user_id
            render :show
        elsif @chirp.private == true
            render :'private'
        end

    end

    def index
        @user = User.find(params[:user_id])
        @chips = @user.chirps.setto_public
        render :all_chirps
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
        @chirp = Chirp.new
        @chirp.sub_tag = params[:chirp][:sub_tag]
        @chirp.content = params[:chirp][:content]
        params[:chirp][:private].to_i == 1 ? @chirp.private = true : @chirp.private = false
        @chirp.user = User.find(session[:id])
        @chirp.tag_id = params[:chirp][:tag_id]

        if @chirp.save
            redirect_to "/chirps/#{@chirp[:id]}"
        else 
            render :create_chirp
        end 
    end
end 
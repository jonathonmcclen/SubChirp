module ChirpHelper

    def user_owns_chirp
        session[:id] == @chirp.user_id
    end 

end

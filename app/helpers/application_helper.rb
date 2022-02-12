module ApplicationHelper

    def logged_in_nav

        @logged_user = User.find(session[:id])

        if session[:id]
            `<div id="top-bar" style="width: 100%; background-color: grey; color: white; height: 20px; margin: 0; padding: 20px 50px;">
              <a href="/users/<%=session[:id]%>/chirps/new"> <button>Create Chirp</button></a> <button>notifications</button>
            </div>`
        end
    end 
end

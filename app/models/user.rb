class User < ActiveRecord::Base
    has_many :chirps

    validates :username, uniqueness: true
    validates :username, presence: true

    validates :email, uniqueness: true
    validates :email, presence: true


    def passwordvalidator

        params[:user][:password]

    end 



    def user_params

    end 
end 
class User < ActiveRecord::Base
    has_secure_password
    has_many :chirps

    validates :username, uniqueness: true
    validates :username, presence: true

    validates :email, uniqueness: true
    validates :email, presence: true

    def user_params

    end 

end 
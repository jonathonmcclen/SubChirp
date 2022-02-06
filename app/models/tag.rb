class Tag < ActiveRecord::Base
    has_many :chirps
    has_many :users, through: :chirps
end 
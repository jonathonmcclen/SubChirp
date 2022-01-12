class Chirp < ActiveRecord::Base
    belongs_to :user

    scope :recent, -> {  }
end 
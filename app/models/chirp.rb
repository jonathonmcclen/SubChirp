class Chirp < ActiveRecord::Base
    belongs_to :user
    belongs_to :tag

    validates :user_id, presence: true
    validates :content, presence: true
    validates :sub_tag, presence: true

    def recent 
        self.last(5)
    end

    scope :setto_private, -> { where(private: true) }
    scope :setto_public, -> { where(private: false) }

    #@private_chirps = @user.chirps.setto_private
end 
class CreateChirps < ActiveRecord::Migration[6.1]
    def change
        create_table :chirps do |t|
            t.string :content
            t.integer :user_id
        end 
    end 
end 
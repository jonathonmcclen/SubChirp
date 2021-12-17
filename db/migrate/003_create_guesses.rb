class CreateGuesses < ActiveRecord::Migration[6.1]
    def change
        create_table :guesses do |t|
            t.string :name
            t.integer :user_id
            t.integer :chirp_id
        end 
    end 
end 
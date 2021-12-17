class CreateLikes < ActiveRecord::Migration[6.1]
    def change
        create_table :likes do |t|
            #join table
            t.integer :user_id
            t.integer :chirp_id
        end 
    end 
end 
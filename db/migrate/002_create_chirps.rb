class CreateChirps < ActiveRecord::Migration[6.1]
    def change
        create_table :chirps do |t|
            t.string :sub_tag
            t.string :content
            t.boolean :private
            t.integer :user_id
            t.integer :tag_id
        end 
    end 
end 
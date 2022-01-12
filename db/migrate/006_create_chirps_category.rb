class CreateChirpsCategory < ActiveRecord::Migration[6.1]
    def change
        create_table :chirps_category do |t|
            t.integer :chirp_id
            t.integer :catagery_id
            t.boolean :private
        end 
    end 
end
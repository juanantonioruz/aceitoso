class CreateProducts < ActiveRecord::Migration
 def self.up
      create_table :products do |t|
        t.integer :heir_id
        t.string :heir_type
        t.string :title
      end
    end

    def self.down
      drop_table :products
    end
end

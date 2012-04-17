class CreateRelacionables < ActiveRecord::Migration
  def change
    create_table :relacionables do |t|
        t.integer :heir_id
        t.string :heir_type
        t.timestamps
    end
  end
end

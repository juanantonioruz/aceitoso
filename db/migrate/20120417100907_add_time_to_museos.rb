class AddTimeToMuseos < ActiveRecord::Migration
  def change
     add_column :museos,:created_at, :timestamp
  
  end
end

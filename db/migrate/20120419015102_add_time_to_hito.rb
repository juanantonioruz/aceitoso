class AddTimeToHito < ActiveRecord::Migration
  def change
              add_column :hitos,:updated_at, :timestamp

     add_column :hitos,:created_at, :timestamp

  end
end

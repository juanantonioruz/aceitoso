class AddTimeToEvento < ActiveRecord::Migration
  def change
                  add_column :eventos,:updated_at, :timestamp

     add_column :eventos,:created_at, :timestamp

  end
end

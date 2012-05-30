class AddTimeToEspacio < ActiveRecord::Migration
  def change
              add_column :espacios,:updated_at, :timestamp

     add_column :espacios,:created_at, :timestamp

  end
end

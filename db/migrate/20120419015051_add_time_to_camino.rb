class AddTimeToCamino < ActiveRecord::Migration
  def change
          add_column :caminos,:updated_at, :timestamp

     add_column :caminos,:created_at, :timestamp

  end
end

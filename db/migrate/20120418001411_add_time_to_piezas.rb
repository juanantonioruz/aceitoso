class AddTimeToPiezas < ActiveRecord::Migration
  def change
      add_column :piezas,:updated_at, :timestamp

     add_column :piezas,:created_at, :timestamp
  end
end

class AddTimeToInfos < ActiveRecord::Migration
  def change
      add_column :infos,:updated_at, :timestamp

     add_column :infos,:created_at, :timestamp

  end
end

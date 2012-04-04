class AddMuseoToEspacios < ActiveRecord::Migration
  def change
    add_column :espacios, :museo_id, :integer

  end
end

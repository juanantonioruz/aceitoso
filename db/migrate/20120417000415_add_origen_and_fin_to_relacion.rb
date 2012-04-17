class AddOrigenAndFinToRelacion < ActiveRecord::Migration
  def change
            add_column :relacions, :origen_id, :integer
            add_column :relacions, :fin_id, :integer

  end
end

class RemoveOrigenGenericaAndFinGenericaAndOrigenMuseoAndFinMuseoToRelacion < ActiveRecord::Migration
  def change
            remove_column :relacions, :generica_origen_id
            remove_column :relacions, :museo_origen_id
            remove_column :relacions, :museo_fin_id
            remove_column :relacions, :generica_fin_id

  end
end

class CreateRelacions < ActiveRecord::Migration
  def change
    create_table :relacions do |t|
      t.integer :museo_origen_id
      t.integer :museo_fin_id
      t.integer :generica_origen_id
      t.integer :generica_fin_id

      t.timestamps
    end
  end
end

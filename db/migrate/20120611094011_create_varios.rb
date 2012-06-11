class CreateVarios < ActiveRecord::Migration
   def change
    create_table :varios do |t|
      t.string :nombre
      t.text :descripcion
      t.references :museo

    end
    add_index :varios, :museo_id
  end
end

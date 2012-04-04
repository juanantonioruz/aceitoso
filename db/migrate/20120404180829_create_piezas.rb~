class CreatePiezas < ActiveRecord::Migration
  def change
    create_table :piezas do |t|
      t.string :nombre
      t.text :descripcion
      t.string :imagen
      t.boolean :coleccion,:default=>0
      t.references :museo

    end
    add_index :piezas, :museo_id
  end
end

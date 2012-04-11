class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|
      t.string :imagen
      t.text :descripcion
      t.references :museo
    end
    add_index :servicios, :museo_id
  end
end

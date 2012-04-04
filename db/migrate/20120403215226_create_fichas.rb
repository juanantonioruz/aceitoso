class CreateFichas < ActiveRecord::Migration
  def change
    create_table :fichas do |t|
      t.string :imagen
      t.text :descripcion
      t.text :contacto
      t.text :llegar
      t.text :horario
      t.string :x
      t.string :y
      t.references :museo

    end
    add_index :fichas, :museo_id
  end
end

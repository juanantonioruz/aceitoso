class CreateHitos < ActiveRecord::Migration
  def change
    create_table :hitos do |t|
      t.string :imagen
      t.string :nombre
      t.text :descripcion
      t.string :x
      t.string :y
      t.references :entorno

    end
    add_index :hitos, :entorno_id
  end
end

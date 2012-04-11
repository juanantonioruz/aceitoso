class CreateUrbanos < ActiveRecord::Migration
  def change
    create_table :urbanos do |t|
      t.string :imagen
      t.string :nombre
      t.text :descripcion
      t.string :x
      t.string :y
      t.references :entorno

    end
    add_index :urbanos, :entorno_id
  end
end

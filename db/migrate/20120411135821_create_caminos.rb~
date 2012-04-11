class CreateCaminos < ActiveRecord::Migration
  def change
    create_table :caminos do |t|
      t.string :imagen
      t.text :descripcion
      t.string :nombre
      t.references :entorno

    end
  end
end

class CreateEspacios < ActiveRecord::Migration
  def change
    create_table :espacios do |t|
      t.string :nombre
      t.string :idplano
      t.text :descripcion
      t.string :imagen

    end
  end
end

class CreateCoordenadas < ActiveRecord::Migration
  def change
    create_table :coordenadas do |t|
      t.string :x
      t.string :y
      t.references :camino

    end
    add_index :coordenadas, :camino_id
  end
end

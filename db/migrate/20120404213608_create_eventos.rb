class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :titulo
      t.string :imagen
      t.text :descripcion
      t.references :museo

    end
    add_index :eventos, :museo_id
  end
end

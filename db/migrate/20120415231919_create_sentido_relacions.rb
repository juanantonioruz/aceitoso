class CreateSentidoRelacions < ActiveRecord::Migration
  def change
    create_table :sentido_relacions do |t|
      t.string :creciente
      t.integer :nombre_relacion_id
      t.timestamps
    end
  end
end

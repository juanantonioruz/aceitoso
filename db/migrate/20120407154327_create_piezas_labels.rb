class CreatePiezasLabels < ActiveRecord::Migration
 def up
    create_table :piezas_labels, :id => false do |t|
    t.references :pieza
    t.references :label
    end
    add_index :piezas_labels, [:pieza_id, :label_id]
    add_index :piezas_labels, [:label_id, :pieza_id]
  end

  def down
      drop_table :piezas_labels
  end
end

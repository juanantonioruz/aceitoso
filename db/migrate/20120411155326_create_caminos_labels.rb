class CreateCaminosLabels < ActiveRecord::Migration
  def up
    create_table :caminos_labels, :id => false do |t|
    t.references :camino
    t.references :label
    end
    add_index :caminos_labels, [:camino_id, :label_id]
    add_index :caminos_labels, [:label_id, :camino_id]
  end

  def down
      drop_table caminos_labels
  end
end

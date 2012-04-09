class CreateEspaciosLabels < ActiveRecord::Migration
  def up
    create_table :espacios_labels, :id => false do |t|
    t.references :espacio
    t.references :label
    end
    add_index :espacios_labels, [:espacio_id, :label_id]
    add_index :espacios_labels, [:label_id, :espacio_id]
  end

  def down
      drop_table :espacios_labels
  end
end

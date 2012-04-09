class CreateEventosLabels < ActiveRecord::Migration
  def up
    create_table :eventos_labels, :id => false do |t|
    t.references :evento
    t.references :label
    end
    add_index :eventos_labels, [:evento_id, :label_id]
    add_index :eventos_labels, [:label_id, :evento_id]
  end

  def down
      drop_table :eventos_labels
  end
end

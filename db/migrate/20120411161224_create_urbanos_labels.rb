class CreateUrbanosLabels < ActiveRecord::Migration
  def up
    create_table :urbanos_labels, :id => false do |t|
    t.references :urbano
    t.references :label
    end
    add_index :urbanos_labels, [:urbano_id, :label_id]
    add_index :urbanos_labels, [:label_id, :urbano_id]
  end

  def down
      drop_table :urbanos_labels
  end
end

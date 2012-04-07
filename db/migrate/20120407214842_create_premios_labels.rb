class CreatePremiosLabels < ActiveRecord::Migration
  def up
    create_table :premios_labels, :id => false do |t|
    t.references :premio
    t.references :label
    end
    add_index :premios_labels, [:premio_id, :label_id]
    add_index :premios_labels, [:label_id, :premio_id]
  end

  def down
      drop_table :premios_labels
  end
end

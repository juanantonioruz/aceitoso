class CreateHitosLabels < ActiveRecord::Migration
  def up
    create_table :hitos_labels, :id => false do |t|
    t.references :hito
    t.references :label
    end
    add_index :hitos_labels, [:hito_id, :label_id]
    add_index :hitos_labels, [:label_id, :hito_id]
  end

  def down
      drop_table hitos_labels
  end
end

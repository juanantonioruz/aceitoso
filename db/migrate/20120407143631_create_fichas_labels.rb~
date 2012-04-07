class CreateFichasLabels < ActiveRecord::Migration
  def up
    create_table :fichas_labels, :id => false do |t|
    t.references :ficha
    t.references :label
    end
    add_index :fichas_labels, [:ficha_id, :label_id]
    add_index :fichas_labels, [:label_id, :ficha_id]
  end

  def down
      drop_table fichas_labels
  end
end

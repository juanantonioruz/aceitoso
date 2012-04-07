class CreatePublicacionsLabels < ActiveRecord::Migration
 def up
    create_table :publicacions_labels, :id => false do |t|
    t.references :publicacion
    t.references :label
    end
    add_index :publicacions_labels, [:publicacion_id, :label_id]
    add_index :publicacions_labels, [:label_id, :publicacion_id]
  end

  def down
      drop_table :publicacions_labels
  end
end

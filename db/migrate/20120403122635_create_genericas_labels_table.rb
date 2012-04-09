class CreateGenericasLabelsTable < ActiveRecord::Migration
  def up
    create_table :genericas_labels, :id => false do |t|
    t.references :generica
    t.references :label
    end
    add_index :genericas_labels, [:generica_id, :label_id]
    add_index :genericas_labels, [:label_id, :generica_id]


  end

  def down
    drop_table :genericas_labels
  end
end

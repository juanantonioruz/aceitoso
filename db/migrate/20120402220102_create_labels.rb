class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :nombre
      t.references :label

      
    end
    add_index :labels, :label_id
  end
end

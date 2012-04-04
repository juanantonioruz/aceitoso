class CreatePublicacions < ActiveRecord::Migration
  def change
    create_table :publicacions do |t|
      t.string :nombre
      t.string :url
      t.text :descripcion
      t.references :museo

    end
    add_index :publicacions, :museo_id
  end
end

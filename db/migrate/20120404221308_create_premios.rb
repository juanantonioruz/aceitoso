class CreatePremios < ActiveRecord::Migration
  def change
    create_table :premios do |t|
      t.string :nombre
      t.string :url
      t.text :descripcion
      t.references :museo

    end
    add_index :premios, :museo_id
  end
end

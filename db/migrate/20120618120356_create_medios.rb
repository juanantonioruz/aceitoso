class CreateMedios < ActiveRecord::Migration
  def change
    create_table :medios do |t|
      t.string :nombre
      t.string :descripcion
      t.boolean :es_audio, :default=>false
       t.references :museo
   end
    add_index :medios, :museo_id
  end
end

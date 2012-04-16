class CreateNombreRelacions < ActiveRecord::Migration
  def change
    create_table :nombre_relacions do |t|
      t.string :nombre1
      t.string :nombre2
      t.timestamps
    end
  end
end

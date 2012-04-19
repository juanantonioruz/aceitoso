class CreatePiezaGenericas < ActiveRecord::Migration
  def change
    create_table :pieza_genericas do |t|
      t.integer :pieza_id
      t.integer :generica_id

      t.timestamps
    end
  end
end

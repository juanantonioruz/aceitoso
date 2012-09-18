class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.string :sid
      t.integer :busquedas

      t.timestamps
    end
  end
end

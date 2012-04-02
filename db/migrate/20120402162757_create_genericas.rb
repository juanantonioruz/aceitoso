class CreateGenericas < ActiveRecord::Migration
  def change
    create_table :genericas do |t|
      t.string :titulo
      t.text :descripcion
      t.string :imagen

      t.timestamps
    end
  end
end

class CreateCaminoGenericas < ActiveRecord::Migration
  def change
    create_table :camino_genericas do |t|
      t.integer :camino_id
      t.integer :generica_id


      t.timestamps
    end
  end
end

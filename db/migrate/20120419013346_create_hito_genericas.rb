class CreateHitoGenericas < ActiveRecord::Migration
  def change
    create_table :hito_genericas do |t|
      t.integer :hito_id
      t.integer :generica_id


      t.timestamps
    end
  end
end

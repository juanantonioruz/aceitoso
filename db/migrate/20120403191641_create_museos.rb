class CreateMuseos < ActiveRecord::Migration
  def change
    create_table :museos do |t|
      t.string :nombre
    end
  end
end

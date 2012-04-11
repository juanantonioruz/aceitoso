class CreateEntornos < ActiveRecord::Migration
  def change
    create_table :entornos do |t|
      t.references :museo
    end
    add_index :entornos, :museo_id
  end
end

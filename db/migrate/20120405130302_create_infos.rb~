class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :url
      t.references :museo

    end
    add_index :infos, :museo_id
  end
end

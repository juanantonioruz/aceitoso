class ChangeColumnUrlToInfoBis < ActiveRecord::Migration
  def change
            change_column :infos, :url, :integer
            rename_column :infos, :url, :generica_id

  end
end

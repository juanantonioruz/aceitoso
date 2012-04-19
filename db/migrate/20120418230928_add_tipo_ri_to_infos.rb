class AddTipoRiToInfos < ActiveRecord::Migration
  def change
            add_column :infos, :tipo_ri, :string

  end
end

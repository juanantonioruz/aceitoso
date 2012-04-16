class AddMensajeOrigenMensajeFinToRelaciones < ActiveRecord::Migration
  def change
        add_column :relacions, :mensaje_origen, :string
        add_column :relacions, :mensaje_fin, :string

  end
end

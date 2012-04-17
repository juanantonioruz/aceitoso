class RemoveMensajeOrigenAndMensajeFinToRelacion < ActiveRecord::Migration
  def change
            remove_column :relacions, :mensaje_origen
            remove_column :relacions, :mensaje_fin
  end
end

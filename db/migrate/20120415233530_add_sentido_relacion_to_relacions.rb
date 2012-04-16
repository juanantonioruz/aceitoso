class AddSentidoRelacionToRelacions < ActiveRecord::Migration
  def change
            add_column :relacions, :sentido_relacion_id, :integer

  end
end

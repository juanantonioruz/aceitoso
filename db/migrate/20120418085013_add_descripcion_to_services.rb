class AddDescripcionToServices < ActiveRecord::Migration
  def change
    add_column :services, :descripcion, :string

  end
end

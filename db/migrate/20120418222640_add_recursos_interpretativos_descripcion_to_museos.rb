class AddRecursosInterpretativosDescripcionToMuseos < ActiveRecord::Migration
  def change
        add_column :museos, :descripcion_ri, :string

  end
end

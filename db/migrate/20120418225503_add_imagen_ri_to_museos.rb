class AddImagenRiToMuseos < ActiveRecord::Migration
  def change
            add_column :museos, :imagen_ri, :string

  end
end

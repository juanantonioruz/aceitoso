class AddNombreCortoMuseo < ActiveRecord::Migration
  def change
      add_column :museos,:nombre_corto, :string


  end
end

class AddArchivoToCamino < ActiveRecord::Migration
  def change
              add_column :caminos,:archivo, :string
  end
end

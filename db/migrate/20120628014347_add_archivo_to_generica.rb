class AddArchivoToGenerica < ActiveRecord::Migration
  def change
                      add_column :genericas,:archivo, :string

  end
end

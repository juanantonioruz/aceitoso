class AddArchivoToHito < ActiveRecord::Migration
  def change
                  add_column :hitos,:archivo, :string

  end
end

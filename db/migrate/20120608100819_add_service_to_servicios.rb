class AddServiceToServicios < ActiveRecord::Migration
  def change
     add_column :servicios,:service_id, :integer
  end
end

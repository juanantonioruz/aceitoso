class AddServiceToHitos < ActiveRecord::Migration
  def change
         add_column :hitos,:service_id, :integer
  end
end

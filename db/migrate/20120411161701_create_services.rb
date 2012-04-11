class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :imagen

    end
  end
end

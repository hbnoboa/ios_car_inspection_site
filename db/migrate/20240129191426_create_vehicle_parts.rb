class CreateVehicleParts < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_parts do |t|
      t.integer :area
      t.string :name

      t.timestamps
    end
  end
end

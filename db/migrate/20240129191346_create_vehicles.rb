class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :location
      t.string :type
      t.string :chassis
      t.integer :nonconformity
      t.string :model
      t.string :status
      t.string :ship
      t.string :situation
      t.text :observations

      t.timestamps
    end
  end
end

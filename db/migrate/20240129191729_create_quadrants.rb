class CreateQuadrants < ActiveRecord::Migration[7.0]
  def change
    create_table :quadrants do |t|
      t.integer :option

      t.timestamps
    end
  end
end

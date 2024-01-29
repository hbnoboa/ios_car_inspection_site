class Sla < ActiveRecord::Migration[7.0]
  def change
    create_table :nonconformities do |t|
      t.references :vehicle_parts, null: false, foreign_key: true
      t.references :nonconformity_types, null: false, foreign_key: true
      t.references :nonconformity_levels, null: false, foreign_key: true
      t.references :quadrants, null: false, foreign_key: true
      t.references :measures, null: false, foreign_key: true
      t.references :nonconformity_locals, null: false, foreign_key: true

      t.timestamps
    end
  end
end

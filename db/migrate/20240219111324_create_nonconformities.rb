class CreateNonconformities < ActiveRecord::Migration[7.0]
  def change
    create_table :nonconformities do |t|
      t.integer :vehicleParts
      t.integer :nonconformityTypes
      t.integer :nonconformityLevels
      t.integer :quadrants
      t.integer :measures
      t.integer :nonconformityLocals
      t.references :vehicles, null: false, foreign_key: true

      t.timestamps
    end
  end
end

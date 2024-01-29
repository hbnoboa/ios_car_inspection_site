class CreateNonconformityLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :nonconformity_levels do |t|
      t.string :level

      t.timestamps
    end
  end
end

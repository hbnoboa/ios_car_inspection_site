class CreateMeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :measures do |t|
      t.string :size

      t.timestamps
    end
  end
end

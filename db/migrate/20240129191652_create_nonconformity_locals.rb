class CreateNonconformityLocals < ActiveRecord::Migration[7.0]
  def change
    create_table :nonconformity_locals do |t|
      t.string :local

      t.timestamps
    end
  end
end

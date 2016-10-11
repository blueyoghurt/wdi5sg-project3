class CreateArealocations < ActiveRecord::Migration[5.0]
  def change
    create_table :arealocations do |t|
      t.string :area
      t.string :location

      t.timestamps
    end
  end
end

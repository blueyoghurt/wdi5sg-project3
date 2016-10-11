class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :address
      t.string :title

      t.timestamps
    end
  end
end

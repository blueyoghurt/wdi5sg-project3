class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :bizowner, index: true, unique: true, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :address
      t.string :title

      t.timestamps
    end
  end
end

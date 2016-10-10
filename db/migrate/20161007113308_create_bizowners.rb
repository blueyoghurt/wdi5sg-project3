class CreateBizowners < ActiveRecord::Migration[5.0]
  def change
    create_table :bizowners do |t|
      t.belongs_to :user, index: true, unique: true, foreign_key: true
      t.string :name
      t.string :address
      t.string :postal_code
      t.text :description
      t.string :license_number

      t.timestamps
    end
  end
end

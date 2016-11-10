class CreateBizownersReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :bizowners_reviews do |t|
      t.belongs_to :jobseeker, foreign_key: true
      t.belongs_to :bizowner, foreign_key: true
      t.belongs_to :application, foreign_key: true
      t.integer :star
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end

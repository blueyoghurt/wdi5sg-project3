class CreateBizownersReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :bizowners_reviews do |t|
      t.belongs_to :jobseeker, index: true, foreign_key: true
      t.belongs_to :bizowner, index: true, foreign_key: true
      t.belongs_to :listing, index: true, foreign_key: true
      t.integer :bizowner_review_star
      t.text :business_review_description
      t.date :job_end_date
      t.boolean :status

      t.timestamps
    end
  end
end

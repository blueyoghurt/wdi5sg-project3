class CreateJobseekersReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :jobseekers_reviews do |t|
      t.belongs_to :jobseeker, index: true, foreign_key: true
      t.belongs_to :bizowner, index: true, foreign_key: true
      t.belongs_to :application, index: true, foreign_key: true
      t.integer :jobseeker_review_star
      t.text :jobseeker_review_description
      t.boolean :status

      t.timestamps
    end
  end
end

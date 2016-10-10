class CreateJobseekersReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :jobseekers_reviews do |t|
      t.integer :jobseeker_id
      t.integer :bizowner_id
      t.integer :jobseeker_review_star
      t.text :jobseeker_review_description
      t.date :job_end_date
      t.boolean :status

      t.timestamps
    end
  end
end

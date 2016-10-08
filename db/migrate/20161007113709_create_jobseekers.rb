class CreateJobseekers < ActiveRecord::Migration[5.0]
  def change
    create_table :jobseekers do |t|
      t.date :dob
      t.string :postal_code
      t.string :highest_qualification
      t.string :preferred_area
      t.text :description
      t.float :wage
      t.date :start_date
      t.date :end_date
      t.boolean :availability

      t.timestamps
    end
  end
end

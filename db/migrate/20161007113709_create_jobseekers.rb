class CreateJobseekers < ActiveRecord::Migration[5.0]
  def change
    create_table :jobseekers do |t|
      t.belongs_to :user, index: true, unique: true, foreign_key: true
      t.date :dob
      t.string :postal_code
      t.string :highest_qualification
      t.string :preferred_area
      t.string :preferred_location
      t.text :description
      t.float :wage
      t.date :start_date
      t.date :end_date
      t.boolean :availability

      t.timestamps
    end
  end
end

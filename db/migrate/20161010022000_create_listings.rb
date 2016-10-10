class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :bizowner_id
      t.string :job_title
      t.text :job_description
      t.string :industry
      t.integer :vacancy
      t.string :work_location_postal_code
      t.string :main_work_location
      t.string :work_location
      t.float :wage_per_hour
      t.date :job_start_date
      t.date :job_end_date
      t.boolean :status

      t.timestamps
    end
  end
end

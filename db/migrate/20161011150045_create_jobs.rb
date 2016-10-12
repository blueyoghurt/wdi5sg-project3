class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :bizowner, index: true, unique: true, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :address
      t.string :title
      t.string :job_title
      t.text :job_description
      t.string :industry
      t.integer :vacancy
      t.float :wage_per_hour
      t.date :job_start_date
      t.date :job_end_date
      t.boolean :status

      t.timestamps
    end
  end
end

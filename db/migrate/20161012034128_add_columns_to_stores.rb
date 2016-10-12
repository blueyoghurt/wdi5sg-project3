class AddColumnsToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :job_title, :string
    add_column :jobs, :job_description, :text
    add_column :jobs, :industry, :string
    add_column :jobs, :vacancy, :integer
    add_column :jobs, :wage_per_hour, :float
    add_column :jobs, :job_start_date, :date
    add_column :jobs, :job_end_date, :date
  end
end

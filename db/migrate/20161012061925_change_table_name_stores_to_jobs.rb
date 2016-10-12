class ChangeTableNameJobsToJobs < ActiveRecord::Migration[5.0]
  def change
      rename_table :jobs, :jobs
  end
end

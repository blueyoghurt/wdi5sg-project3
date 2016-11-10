class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.integer :job_id
      t.integer :jobseeker_id
      t.string :status

      t.timestamps
    end
  end
end

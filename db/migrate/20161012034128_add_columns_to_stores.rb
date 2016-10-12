class AddColumnsToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :job_title, :string
    add_column :stores, :job_description, :text
    add_column :stores, :industry, :string
    add_column :stores, :vacancy, :integer
    add_column :stores, :wage_per_hour, :float
    add_column :stores, :job_start_date, :date
    add_column :stores, :job_end_date, :date
  end
end

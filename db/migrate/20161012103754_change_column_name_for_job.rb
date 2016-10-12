class ChangeColumnNameForJob < ActiveRecord::Migration[5.0]
  def change
     rename_column :jobs, :title, :company_name
  end
end

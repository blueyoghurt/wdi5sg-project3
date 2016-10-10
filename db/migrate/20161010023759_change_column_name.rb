class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :listings, :business_owner_id, :bizowner_id
  end
end

class AddStatusColumnToStores < ActiveRecord::Migration[5.0]
  def change
      add_column :stores, :status, :boolean
  end
end

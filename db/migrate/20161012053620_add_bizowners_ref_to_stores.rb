class AddBizownersRefToStores < ActiveRecord::Migration[5.0]
  def change
      add_reference :stores, :bizowner, index: true, foreign_key: true
    end
end


  

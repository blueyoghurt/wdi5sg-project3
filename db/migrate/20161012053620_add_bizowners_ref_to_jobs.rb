class AddBizownersRefToJobs < ActiveRecord::Migration[5.0]
  def change
      add_reference :jobs, :bizowner, index: true, foreign_key: true
    end
end


  

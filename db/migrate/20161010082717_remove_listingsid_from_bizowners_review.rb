class RemoveListingsidFromBizownersReview < ActiveRecord::Migration[5.0]
  def change
       remove_column :bizowners_reviews, :listing_id, :integer
  end
end

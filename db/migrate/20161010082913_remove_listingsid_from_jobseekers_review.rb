class RemoveListingsidFromJobseekersReview < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobseekers_reviews, :listing_id, :integer
  end
end

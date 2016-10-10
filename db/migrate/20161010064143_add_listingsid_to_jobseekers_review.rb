class AddListingsidToJobseekersReview < ActiveRecord::Migration[5.0]
  def change
      add_column :jobseekers_reviews, :listing_id, :integer
  end
end

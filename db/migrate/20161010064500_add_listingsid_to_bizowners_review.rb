class AddListingsidToBizownersReview < ActiveRecord::Migration[5.0]
  def change
      add_column :bizowners_reviews, :listing_id, :integer
  end
end

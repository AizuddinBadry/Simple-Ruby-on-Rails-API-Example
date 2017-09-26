class AddReferencesToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :listing_id, :bigint
  end
end

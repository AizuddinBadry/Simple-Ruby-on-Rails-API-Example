class AddRateToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :rate, :string
  end
end

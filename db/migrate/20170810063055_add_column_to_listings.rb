class AddColumnToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :images2, :string
    add_column :listings, :images3, :string
    add_column :listings, :images4, :string
  end
end

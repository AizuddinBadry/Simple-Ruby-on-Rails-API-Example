class AddDetailsToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :title, :string
    add_column :listings, :category, :string
    add_column :listings, :price, :integer
    add_column :listings, :state, :string
    add_column :listings, :address, :string
    add_column :listings, :city, :string
    add_column :listings, :zipcode, :string
    add_column :listings, :images, :string
    add_column :listings, :description, :string
    add_column :listings, :phone, :string
    add_column :listings, :website, :string
    add_column :listings, :email, :string
  end
end

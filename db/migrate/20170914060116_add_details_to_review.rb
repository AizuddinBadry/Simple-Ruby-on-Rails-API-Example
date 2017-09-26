class AddDetailsToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :name, :string
    add_column :reviews, :email, :string
    add_column :reviews, :review, :string
    add_column :reviews, :approved, :boolean
  end
end

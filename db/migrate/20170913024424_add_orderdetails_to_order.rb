class AddOrderdetailsToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :description, :string
    add_column :orders, :duration, :string
  end
end

class AddDetailsToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :title, :string
    add_column :orders, :images, :string
    add_column :orders, :category, :string
    add_column :orders, :status_by_hobbez, :string
    add_column :orders, :status_by_customer, :string
    add_column :orders, :customer_id, :bigint
    add_column :orders, :hobbez_id, :bigint
    add_column :orders, :references, :string
  end
end

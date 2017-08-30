class AddDetailsToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :name, :string
    add_column :transactions, :email, :string
    add_column :transactions, :amount, :bigint
    add_column :transactions, :status, :string
    add_column :transactions, :bill_id, :string
    add_column :transactions, :bill_url, :string
  end
end

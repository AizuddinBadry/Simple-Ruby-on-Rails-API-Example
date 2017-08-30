class AddAccountnumberToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :account_numbers, :bigint
  end
end

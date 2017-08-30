class AddBankToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :banks, :string
  end
end

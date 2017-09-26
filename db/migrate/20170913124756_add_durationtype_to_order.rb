class AddDurationtypeToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :duration_type, :string
  end
end

class AddDetailsToTaskNotCompleted < ActiveRecord::Migration[5.1]
  def change
    add_column :task_not_completeds, :listing_id, :bigint
    add_column :task_not_completeds, :description, :string
  end
end

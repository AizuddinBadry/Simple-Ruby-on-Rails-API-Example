class AddDetailsToTaskCompleted < ActiveRecord::Migration[5.1]
  def change
    add_column :task_completeds, :listing_id, :bigint
    add_column :task_completeds, :upvote, :bigint
    add_column :task_completeds, :downvote, :bigint
  end
end

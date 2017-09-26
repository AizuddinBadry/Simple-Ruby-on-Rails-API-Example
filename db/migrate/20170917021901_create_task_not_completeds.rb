class CreateTaskNotCompleteds < ActiveRecord::Migration[5.1]
  def change
    create_table :task_not_completeds do |t|

      t.timestamps
    end
  end
end

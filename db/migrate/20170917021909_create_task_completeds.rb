class CreateTaskCompleteds < ActiveRecord::Migration[5.1]
  def change
    create_table :task_completeds do |t|

      t.timestamps
    end
  end
end

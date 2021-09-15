class AddTasksCountToProjects < ActiveRecord::Migration[6.1]
  def up
    add_column :projects, :tasks_count, :integer
    Project.all.each do |project|
      Project.reset_counters(project.id, :tasks)
    end
  end

  def down
    remove_column :projects, :tasks_count
  end
end

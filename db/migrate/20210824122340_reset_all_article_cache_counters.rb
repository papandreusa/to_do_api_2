class ResetAllArticleCacheCounters < ActiveRecord::Migration[6.1]
  def up
    Project.all.each do |project|
      Project.reset_counters(project.id, :tasks)
    end
  end
end

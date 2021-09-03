class Task < ApplicationRecord
  belongs_to :project, counter_cache: true
  acts_as_list scope: :project
end

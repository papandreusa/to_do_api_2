class Task < ApplicationRecord
  belongs_to :project, counter_cache: true
  acts_as_list scope: :project
  has_many :comments, -> { order('comments.created_at desc') }, dependent: :destroy, inverse_of: :task
end

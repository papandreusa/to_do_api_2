class Comment < ApplicationRecord
  belongs_to :task
  has_many_attached :images
end

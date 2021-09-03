class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy, inverse_of: :project
end

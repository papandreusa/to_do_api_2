module Docs::V1::Tasks
  extend Dox::DSL::Syntax

  document :api do
    resource 'Tasks' do
      endpoint '/tasks'
      group 'Tasks'
    end
  end

  document :index do
    action 'Get Tasks'
  end
  document :show do
    action 'Get Task'
  end
  document :create do
    action 'Create Task'
  end
  document :update do
    action 'Update Task'
  end
  document :update_position do
    action 'Change position of Task'
  end
  document :update_done do
    action 'Mark Task as Completed'
  end
  document :destroy do
    action 'Delete Task'
  end
end

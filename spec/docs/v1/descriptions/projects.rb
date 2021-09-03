module Docs::V1::Project
  extend Dox::DSL::Syntax

  document :api do
    resource 'Projects' do
      endpoint '/projects'
      group 'Projects'
    end
  end

  document :index do
    action 'Get Projects'
  end
  document :show do
    action 'Get Project'
  end
  document :create do
    action 'Create Project'
  end
  document :update do
    action 'Update Project'
  end
  document :destroy do
    action 'Delete Project'
  end
end

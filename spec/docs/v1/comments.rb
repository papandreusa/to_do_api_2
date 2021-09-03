module Docs::V1::Comments
  extend Dox::DSL::Syntax

  document :api do
    resource 'Comments' do
      endpoint '/comments'
      group 'Comments'
    end
  end

  document :index do
    action 'Get Comments'
  end
  document :create do
    action 'Create Comment'
  end
  document :destroy do
    action 'Delete Comment'
  end
end

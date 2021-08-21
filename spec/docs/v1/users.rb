module Docs::V1::Users
  extend Dox::DSL::Syntax

  document :api do
    resource 'Users' do
      endpoint '/users'
      group 'Authentication'
    end
  end

  document :create do
    action 'Registration'
  end
end

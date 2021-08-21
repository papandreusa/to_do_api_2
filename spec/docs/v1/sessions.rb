module Docs::V1::Sessions
  extend Dox::DSL::Syntax

  document :api do
    resource 'Sessions' do
      endpoint '/sesions'
      group 'Authentication'
    end
  end

  document :create do
    action 'Sign In'
  end
  document :destroy do
    action 'Sign Out'
  end
end

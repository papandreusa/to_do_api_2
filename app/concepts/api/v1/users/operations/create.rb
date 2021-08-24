class Api::V1::Users::Operations::Create < Trailblazer::Operation
  include Api::V1::Users

  step Model(User, :new)
  step Contract::Build(constant: Contracts::Create)
  step Contract::Validate()
  step Contract::Persist()
  step Subprocess(Api::V1::Sessions::Operations::Create)
end

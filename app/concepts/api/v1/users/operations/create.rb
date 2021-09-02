class Api::V1::Users::Operations::Create < Trailblazer::Operation
  step Model(User, :new)
  step Contract::Build(constant: Api::V1::Users::Contracts::Create)
  step Contract::Validate()
  step Contract::Persist()
  step Subprocess(Api::V1::Sessions::Operations::Create)
end

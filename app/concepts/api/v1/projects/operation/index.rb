class Api::V1::Projects::Operation::Index < Trailblazer::Operation

  step Subprocess(Api::V1::Lib::Operation::Authenticate)
  step :index!

private

  def index!(options, **)
    options[:data] = Project.all
  end

end

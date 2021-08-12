class Api::V1::Projects::Operation::Index < Trailblazer::Operation

  # step :build_model!
  # step :assign_current_user!
  # step :assign_contract!
  # step :validate!
  # step :save!
  step :index!

  # def build_model!(options, **)
  #   options[:model] = ::Project.new
  # end

  # def assign_current_user!(options, **)
  #   options[:model].user = options[:user]
  # end

  # def assign_contract!(options, **)
  #   options[:contract] = Api::V1::Projects::Contract::Create.new(options[:model])
  # end

  # def validate!(options, params:,**)
  #   options[:contract].validate(params)
  # end

  # def save!(options, params:, **)
  #   options[:contract].save(params)
  # end

private

  def index!(options, **)
    options[:model] = Project.new
    options[:data] = Project.all
  end

end

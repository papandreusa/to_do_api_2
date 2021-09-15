class Api::V1::Tasks::Contracts::UpdatePosition < Reform::Form
  property :position, virtual: true
  property :itself

  validation name: :default do
    params do
      required(:position).filled(:int?, gteq?: Api::V1::Constants::Task::POSITION_MIN)
      required(:itself)
    end

    rule(:position) do
      unless values[:position] <= values[:itself].project.tasks.count
        key.failure(:lteq?, num: values[:itself].project.tasks.count)
      end
    end
  end
end

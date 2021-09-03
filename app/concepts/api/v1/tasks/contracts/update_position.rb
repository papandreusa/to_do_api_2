class Api::V1::Tasks::Contracts::UpdatePosition < Reform::Form
  property :position, virtual: true
  property :project

  validation name: :default do
    params do
      required(:position).filled(:int?)
      required(:project)
    end

    rule :position do
      unless values[:position].between?(1, values[:project].tasks_count)
        key(:position).failure(I18n.t('errors.be_between',
                                      min: Api::V1::Tasks::Constants::POSITION_MIN, max: values[:project].tasks_count))
      end
    end
  end
end

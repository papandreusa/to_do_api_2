class Api::V1::Tasks::Contracts::Update < Reform::Form
  property :name
  property :due_date

  validation name: :default do
    params do
      required(:name).filled
      optional(:due_date).maybe(:date)
    end
  end
end

class Api::V1::ProjectsController < Api::V1::StandardController
  def index
    super do
      Api::V1::Projects::Service::Index.call(params, context)
    end
  end

  def show
    super do
      Api::V1::Projects::Service::Show.call(params, context)
    end
  end

  def create
    super do
      Api::V1::Projects::Service::Create.call(params, context)
    end
  end

  def update
    super do
      Api::V1::Projects::Service::Update.call(params, context)
    end
  end

  def destroy
    super do
      Api::V1::Projects::Service::Delete.call(params, context)
    end
  end
end

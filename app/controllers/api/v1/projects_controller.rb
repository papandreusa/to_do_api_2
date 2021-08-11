class Api::V1::ProjectsController < Api::V1::StandardController
  def index
    super do
      Api::V1::Projects::Service::Index.call(context, params)
    end
  end

  def show
    super do
      Api::V1::Projects::Service::Show.call(context, params)
    end
  end

  def create
    super do
      Api::V1::Projects::Service::Create.call(context, params)
    end
  end

  def update
    super do
      Api::V1::Projects::Service::Update.call(context, params)
    end
  end

  def destroy
    super do
      Api::V1::Projects::Service::Destroy.call(context, params)
    end
  end
end

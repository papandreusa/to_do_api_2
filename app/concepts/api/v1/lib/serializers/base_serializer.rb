class Api::V1::Lib::Serializers::BaseSerializer
  include JSONAPI::Serializer

  def initialize(resource, options = {})
    options.empty? ? super : super(resource, collection_options(**options))
  end

  def collection_options(**)
    {}
  end
end

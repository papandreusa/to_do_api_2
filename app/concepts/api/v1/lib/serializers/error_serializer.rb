class Api::V1::Lib::Serializers::ErrorSerializer
  def initialize(resource)
    @resource = resource
    @result = {}
  end

  def serialize
    result[:errors] = resource&.messages&.map do |attribute, messages|
      messages.map { |message| { title: attribute, detail: message } }
    end&.flatten
    result
  end

  private

  attr_reader :resource, :result
end

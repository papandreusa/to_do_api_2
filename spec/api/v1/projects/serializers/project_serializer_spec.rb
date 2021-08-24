RSpec.describe Api::V1::Projects::Serializers::ProjectSerializer, type: :serializer do
  subject(:serializer) { described_class.new(project) }

  let(:project) { create(:project) }

  before { create_list(:project, 2) }

  it { expect(serializer.to_json).to match_json_schema('v1/projects/project') }
  it { expect(described_class.new(Project.all).to_json).to match_json_schema('v1/projects/projects') }
end

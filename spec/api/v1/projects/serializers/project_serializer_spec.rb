RSpec.describe Api::V1::Projects::Serializers::ProjectSerializer, type: :serializer do
  subject(:serializer) { described_class.new(*args).to_json }

  let(:project) { create(:project) }

  before { create_list(:project, 2) }

  describe 'instance' do
    let(:args) { project }

    it { is_expected.to match_json_schema('v1/projects/instance') }
  end

  describe 'collection' do
    let(:args) { [Project.all] }

    it { is_expected.to match_json_schema('v1/projects/collection') }
  end
end

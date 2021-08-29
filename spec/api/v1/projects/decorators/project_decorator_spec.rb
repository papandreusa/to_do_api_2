RSpec.describe Api::V1::Projects::Decorators::ProjectDecorator, type: :decorator do
  subject(:decorator) { described_class.new(project) }

  let(:project) { create(:project) }
  let(:params) { { page: 1 } }

  it { expect(described_class.instance_url(project)).to eq api_v1_project_path(project) }
  it { expect(described_class.collection_url(**params)).to eq api_v1_projects_path(**params) }
end

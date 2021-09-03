RSpec.describe Api::V1::Tasks::Serializers::TaskSerializer, type: :serializer do
  subject(:serializer) { described_class.new(*args).to_json }

  let(:project) { create(:project, :with_tasks) }
  let(:task) { create(:task, project: project) }

  describe 'instance' do
    let(:args) { task }

    it { is_expected.to match_json_schema('v1/tasks/instance') }
  end

  describe 'has json schema' do
    let(:args) { [project.tasks, { project: project }] }

    it { is_expected.to match_json_schema('v1/tasks/collection') }
  end
end

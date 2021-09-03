RSpec.describe Api::V1::Tasks::Decorators::TaskDecorator, type: :decorator do
  let(:project) { create(:project) }
  let(:task) { create(:task, project: project) }
  let(:params) { { sort: 'position' } }

  describe '.instanve_url' do
    it { expect(described_class.instance_url(task)).to eq api_v1_task_path(task) }
  end

  describe '.collection_url' do
    it { expect(described_class.collection_url(project, **params)).to eq api_v1_project_tasks_path(project, **params) }
  end
end

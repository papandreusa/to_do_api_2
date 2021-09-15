RSpec.describe Api::V1::Tasks::Queries::FetchTasks, type: :queries do
  subject(:result) { described_class.call(current_user: project.user, project: project, params: params) }

  let!(:project) { create(:project) }
  let!(:task1) { create(:task, project: project, name: 'xyz', position: 3) }
  let!(:task2) { create(:task, project: project, name: 'klm', position: 1) }
  let!(:task3) { create(:task, project: project, name: 'abc', position: 2) }

  context 'when sort by position' do
    let(:params) { { sort: 'position' } }

    it { expect(result.to_a).to eql [task2, task3, task1] }
  end

  context 'when sort by name' do
    let(:params) { { sort: 'name_desc' } }

    it { expect(result.to_a).to eql [task1, task2, task3] }
  end
end

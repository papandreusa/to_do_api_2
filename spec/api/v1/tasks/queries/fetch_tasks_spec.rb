RSpec.describe Api::V1::Tasks::Queries::FetchTasks, type: :queries do
  subject(:result) { described_class.call(current_user: user, project: project, params: params) }

  let!(:user) { create(:user) }
  let!(:project) { create(:project, :with_tasks, user: user) }

  context 'when sort by position' do
    let(:params) { { sort: 'position' } }

    it { expect(result.to_a).to eql project.tasks.sort_by(&:position) }
  end

  context 'when sort by name' do
    let(:params) { { sort: 'name_desc' } }

    it { expect(result.to_a).to eql project.tasks.sort_by(&:name).reverse }
  end
end

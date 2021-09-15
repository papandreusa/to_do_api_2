RSpec.describe Api::V1::Tasks::Policies::TaskPolicy, type: :policy do
  subject { described_class.new(user, task) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  %i[show create update destroy].each do |action|
    describe "##{action}?" do
      context 'when user is owner of project' do
        let(:task) { create(:task, project: project) }

        it { is_expected.to permit_action(action) }
      end

      context 'when user is not owner of project' do
        let(:task) { create(:task) }

        it { is_expected.not_to permit_action(action) }
      end
    end
  end

  context 'when user is owner of project' do
    let(:task) { create(:task, project: project) }

    it { expect(described_class::Scope.new(user, project.tasks).resolve).to include(task) }
  end
end

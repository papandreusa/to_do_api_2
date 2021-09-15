RSpec.describe Api::V1::Comments::Policies::CommentPolicy, type: :policy do
  subject { described_class.new(user, comment) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }
  let(:comment) { create(:comment, task: task) }

  %i[index create destroy].each do |action|
    describe "##{action}?" do
      context 'when user is owner of project' do
        it { is_expected.to permit_action(action) }
      end

      context 'when user is not owner of project' do
        let(:task2) { create(:task) }
        let(:comment) { create(:comment, task: task2) }

        it { is_expected.not_to permit_action(action) }
      end
    end
  end

  context 'when user is owner of project' do
    it { expect(described_class::Scope.new(user, task.comments).resolve).to include(comment) }
  end
end

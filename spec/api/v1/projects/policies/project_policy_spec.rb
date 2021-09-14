RSpec.describe Api::V1::Projects::Policies::ProjectPolicy, type: :policy do
  subject { described_class.new(user, project) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  %i[show create update destroy].each do |action|
    describe "##{action}?" do
      context 'when user is owner of project' do
        it { is_expected.to permit_action(action) }
      end

      context 'when user is not owner of project' do
        let(:project) { create(:project) }

        it { is_expected.not_to permit_action(action) }
      end
    end
  end

  context 'when user is owner of project' do
    it { expect(described_class::Scope.new(user, Project.all).resolve).to include(project) }
  end
end

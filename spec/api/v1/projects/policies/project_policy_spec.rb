RSpec.describe Api::V1::Projects::Policies::ProjectPolicy, type: :policy do
  subject { described_class.new(user, project) }

  let(:user) { create(:user) }

  context 'when user is owner of project' do
    let(:project) { create(:project, user: user) }

    it { is_expected.to permit_actions(%i[index show create update destroy]) }
    it { expect(described_class::Scope.new(user, Project.all).resolve).to include(project) }
  end

  context 'when user is not owner of project' do
    let(:project) { create(:project) }

    it { is_expected.not_to permit_actions(%i[index show create update destroy]) }
    it { expect(described_class::Scope.new(user, Project.all).resolve).not_to include(project) }
  end
end

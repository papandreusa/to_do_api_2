RSpec.describe Api::V1::Projects::Services::FetchProjectsService, type: :service do
  let!(:user) { create(:user) }

  before { create_list(:project, 2, user: user) }

  it { expect(described_class.call(current_user: user)[0]).to be_a Pagy }
  it { expect(described_class.call(current_user: user)[1]).to be_a ActiveRecord::Relation }
end

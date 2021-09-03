RSpec.describe Api::V1::Projects::Services::FetchProjectsService, type: :service do
  subject(:result) { described_class.call(current_user: user) }

  let!(:user) { create(:user) }

  before { create_list(:project, 2, user: user) }

  it { expect(result[0]).to be_a Pagy }
  it { expect(result[1]).to be_a ActiveRecord::Relation }
end

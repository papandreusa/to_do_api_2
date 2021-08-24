RSpec.describe 'Delete Project', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Destroy

  let(:name) { FFaker::Lorem.word }
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }

  describe 'Success result' do
    before do
      delete api_v1_project_path(project), headers: authenticated_header(user)
    end

    it 'deletes project', :dox do
      expect(response).to have_http_status(:no_content)
    end

    it { expect(Project.find_by(id: project.id)).to be_nil }
  end

  describe 'fail result' do
    context 'when update invalid project' do
      let(:invalid_id) { :invalid_id }

      before do
        delete api_v1_project_path(invalid_id), headers: authenticated_header(user)
      end

      it 'deletes project with invalid id', :dox do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when unauthenticated' do
      before do
        delete api_v1_project_path(project), headers: headers
      end

      it { expect(response).to have_http_status(:unauthorized) }
    end

    context 'when accesses project of other user' do
      let(:project2) { create(:project) }

      before do
        delete api_v1_project_path(project2), headers: authenticated_header(user)
      end

      it 'gets project of ohter user', :dox do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end

RSpec.describe 'Api::V1::Projects::Operations::Destroy', type: :request do
  include Docs::V1::Projects::Api
  include Docs::V1::Projects::Destroy

  let(:name) { FFaker::Lorem.word }
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let(:header) { { 'CONTENT_TYPE' => 'application/json' } }

  describe 'Success result' do
    before do
      delete api_v1_project_path(project), headers: header.merge(authenticated_header(user))
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
        delete api_v1_project_path(invalid_id), headers: header.merge(authenticated_header(user))
      end

      it 'deletes project with invalid id', :dox do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when unauthenticated' do
      before do
        delete api_v1_project_path(project), params: { header: header }
      end

      it { expect(response).to have_http_status(:unauthorized) }
    end
  end
end

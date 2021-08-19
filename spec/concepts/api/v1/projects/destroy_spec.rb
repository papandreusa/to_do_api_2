RSpec.describe 'Api::V1::Projects::Operations::Destroy', type: :request do
  include Docs::V1::Projects::Api

  # include ApiDoc::V1::User::Registration::Create
  let(:name) { FFaker::Lorem.word }
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  describe 'Success result' do
    include Docs::V1::Projects::Destroy
    before do
      delete api_v1_project_path(project), headers: authenticated_header(user)
    end

    it 'responses status ok', :dox do
      expect(response).to have_http_status(:no_content)
    end


    it { expect(Project.find_by(id: project.id)).to be_nil }
  end

  describe 'fail result' do
    context 'when unauthenticated' do
      before do
        delete api_v1_project_path(project)
      end

      it 'responses with status ' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when update invalid project' do
      let(:invalid_id) { :invalid_id }

      before do
        delete api_v1_project_path(invalid_id), headers: authenticated_header(user)
      end

      it 'renders with json schema ' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end

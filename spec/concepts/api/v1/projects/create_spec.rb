RSpec.describe 'Api::V1::Projects::Operations::Create', type: :request do
  # include ApiDoc::V1::User::Registration::Api

  # include ApiDoc::V1::User::Registration::Create
  let(:name) { FFaker::Lorem.word }
  let(:valid_params) { { name: name } }
  let!(:user) { create(:user) }

  describe 'Success result' do
    before do
      post api_v1_projects_path, params: valid_params, headers: authenticated_header(user)
    end

    it 'renders created project', :dox do
      expect(response).to have_http_status(:created)
    end

    it 'renders with json schema' do
      expect(response).to match_json_schema('api/v1/projects/project')
    end

    it { expect(JSON.parse(response.body)['data']['attributes']['name']).to eql name }
  end

  describe 'fail result' do
    context 'when unauthenticated' do
      before do
        post api_v1_projects_path, params: valid_params
      end

      it 'responses with status ' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when post invalid params' do
      let(:invalid_params) { { name: nil } }

      before do
        post api_v1_projects_path, params: invalid_params, headers: authenticated_header(user)
      end

      it 'renders with json schema ' do
        expect(response).to match_json_schema('api/v1/base/errors')
      end
    end
  end
end

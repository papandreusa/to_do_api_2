RSpec.describe 'Api::V1::Project::Create', type: :request do
  # include ApiDoc::V1::User::Registration::Api

  describe 'POST #create' do
    # include ApiDoc::V1::User::Registration::Create

    describe 'Success' do
      let(:valid_params) { { name: 'abcdef' }.to_json }
      let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }
      let!(:user) { create(:user) }

      before do
        post '/api/v1/projects', params: valid_params, headers: headers.merge(authenticated_header(user))
      end

      it 'renders index of projects', :dox do
        get '/api/v1/projects', headers: headers.merge(authenticated_header(user))
        expect(response).to have_http_status(:ok)
      end

      it 'renders created project', :dox do
        post '/api/v1/projects', params: valid_params, headers: headers.merge(authenticated_header(user))
        expect(response).to have_http_status(:created)
      end

      xit { expect(response).to match_json_schema('projects/create') }
    end
  end
end

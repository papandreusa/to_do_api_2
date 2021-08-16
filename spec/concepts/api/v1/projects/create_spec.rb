RSpec.describe 'Api::V1::Project::Create', type: :request do
  # include ApiDoc::V1::User::Registration::Api

  xdescribe 'POST #create' do
    # include ApiDoc::V1::User::Registration::Create

    describe 'Success' do
      let(:valid_params) do
        {
          name: FFaker::Lorem.word
        }.to_json
      end
      let(:token) { 'token' }
      let(:json_api_header) do
        {
          Authorization: token
        }
      end

      before { post '/api/v1/projects', params: valid_params, headers: json_api_headers }

      it 'renders created user', :dox do
        expect(response).to be_created
        expect(response).to match_json_schema('user/registration')
      end
    end
  end
end

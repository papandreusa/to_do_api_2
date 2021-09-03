RSpec.shared_examples 'has unprocessable entity status' do |schema: 'v1/base/errors'|
  let(:headers) { authenticated_header(user) }

  it 'has `unprocessable entity` response', :dox do
    expect(response)
      .to have_http_status(:unprocessable_entity)
      .and match_json_schema(schema)
  end
end

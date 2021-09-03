RSpec.shared_examples 'has created status' do |schema:|
  let(:headers) { authenticated_header(user) }

  it 'has `created` response', :dox do
    expect(response)
      .to have_http_status(:created)
      .and match_json_schema(schema)
  end
end

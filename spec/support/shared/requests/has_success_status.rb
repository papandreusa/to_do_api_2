RSpec.shared_examples 'has success status' do |schema:|
  let(:headers) { authenticated_header(user) }

  it 'has `success` response', :dox do
    expect(response)
      .to have_http_status(:ok)
      .and match_json_schema(schema)
  end
end

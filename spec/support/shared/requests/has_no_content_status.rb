RSpec.shared_examples 'has no content status' do
  let(:headers) { authenticated_header(user) }

  it 'has `no content` response', :dox do
    expect(response).to have_http_status(:no_content)
  end
end

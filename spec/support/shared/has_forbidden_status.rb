RSpec.shared_examples 'has forbidden status' do
  let(:headers) { authenticated_header(user) }

  it 'has `forbidden` status', :dox do
    expect(response).to have_http_status(:forbidden)
  end
end

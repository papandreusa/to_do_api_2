RSpec.shared_examples 'has unauthorized status' do
  let(:headers) { unauthenticated_header }

  it 'has `unauthorized` status', :dox do
    expect(response).to have_http_status(:unauthorized)
  end
end

RSpec.shared_examples 'has not found status' do
  context 'when project not found' do
    let(:headers) { authenticated_header(user) }

    it 'has `not found` status', :dox do
      expect(response).to have_http_status(:not_found)
    end
  end
end

RSpec.shared_examples 'project validation fails' do
  let(:params) { { name: '' } }

  it { is_expected.to be_failure }
end

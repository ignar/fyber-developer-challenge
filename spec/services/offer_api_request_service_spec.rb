require 'rails_helper'

RSpec.describe OfferApiRequestService, type: :service do
  let(:params) {{
    appid: 157,
    device_id: '2b6f0cc904d137be2e1730235f5664094b83',
    locale: :de,
    ip: '109.235.143.113',
    offer_types: 112,
    uid: '123',
    pub0: 'custom-parameter',
    page: 1
  }}
  let(:request_object) { RequestObject.new(params) }

  subject { described_class.new(request_object) }

  before(:each) do
    stub_request(:get, /#{described_class::ENDPOINT}(.*)/).
      to_return(status: 200, body: File.read(Rails.root.join('spec', 'fixtures', '200.json')))
  end

  it 'makes request to api' do
    subject.call

    expect(a_request(:get, /#{described_class::ENDPOINT}/)).to have_been_made.once
  end

  it 'returns answer object' do
    answer = subject.call
    expect(answer).to be_kind_of(AnswerObject)
  end

  describe 'error handling' do

  end
end

require 'rails_helper'

RSpec.describe HashkeyService, type: :service do
  let(:params) {{
    appid: 157,
    device_id: '2b6f0cc904d137be2e1730235f5664094b831186',
    locale: :de,
    ip: '212.45.111.17',
    ps_time: 1312211903,
    uid: 'player1',
    pub0: 'campaign2',
    timestamp: 1312553361,
    page: 2
  }}
  let(:request_object) { RequestObject.new(params) }

  subject { described_class.new(Rails.application.secrets.api_key) }

  describe '#create_hashkey_for_request' do
    it 'creates proper hashkey for request' do
      expect(subject.create_hashkey_for_request(request_object)).to eq('7c6ec7dd7ad1fadb324f8802ecb03ac2e5823628')
    end
  end

  describe '#create_haskey_for_answer' do
    let(:answer) { Rails.root.join('spec', 'fixtures', '200.json').read }

    it 'creates sign for answer' do
      hashkey = subject.create_haskey_for_answer(answer)
      expect(hashkey).to eq('2998666632e5b6dd1a8c8223cdf6a3acdacb51ea')
    end
  end
end

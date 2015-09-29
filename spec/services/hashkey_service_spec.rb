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

  subject { described_class.new(request_object) }

  it 'creates proper hash key for request' do
    expect(subject.create_hashkey).to eq('c223349e33a196c9cc6be6fa39921869b20f5ee4')
  end
end

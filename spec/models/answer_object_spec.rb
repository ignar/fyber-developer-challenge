require 'rails_helper'

RSpec.describe AnswerObject, type: :model do
  subject { AnswerObject.new }

  it { is_expected.to respond_to(:offers) }
  it { is_expected.to respond_to(:data) }
  it { is_expected.to respond_to(:status) }

  describe '#offers' do
    context 'offers present' do
      subject {
        json = ActiveSupport::JSON.decode Rails.root.join('spec', 'fixtures', '200.json').read
        AnswerObject.new(status: 200, data: json)
      }

      it 'renders offers from response' do
        expect(subject.offers.count).to eq(30)
      end
    end

    context 'no offers' do
      subject {
        AnswerObject.new(status: 200, data: { 'offers' => [] })
      }

      it 'renders offers from response' do
        expect(subject.offers.count).to eq(0)
      end
    end
  end
end

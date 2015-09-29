require 'rails_helper'

RSpec.describe RequestObject, type: :model do
  subject { RequestObject.new }

  describe '#timestamp' do
    it 'is predefined by default' do
      expect(subject.timestamp).not_to be_blank
    end
  end

  describe '#locale' do
    it 'is predefined by default' do
      expect(subject.locale).not_to be_blank
    end
  end
end

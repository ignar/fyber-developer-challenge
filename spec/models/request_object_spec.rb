require 'rails_helper'

RSpec.describe RequestObject, type: :model do
  subject { RequestObject.new }

  describe 'format' do
    it 'is predefined by default' do
      expect(subject.format).not_to be_blank
    end
  end

  describe 'locale' do
    it 'is predefined by default' do
      expect(subject.locale).not_to be_blank
    end
  end
end

require 'rails_helper'

RSpec.describe RequestForm, type: :form do
  subject { RequestForm.new }

  it { is_expected.to validate_presence_of(:uid) }
  it { is_expected.to validate_presence_of(:pub0) }
  it { is_expected.to validate_presence_of(:page) }
  it { is_expected.to validate_numericality_of(:page) }
end

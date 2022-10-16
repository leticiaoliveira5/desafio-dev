require 'rails_helper'

RSpec.describe CnabFile, type: :model do
  context 'validations' do
    it { is_expected.to have_many(:stores) }
  end
end

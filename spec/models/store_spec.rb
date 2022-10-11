require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:owner) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to belong_to(:user) }
  end
end

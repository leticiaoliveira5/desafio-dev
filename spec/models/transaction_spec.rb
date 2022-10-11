require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_presence_of(:sold_at) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:document) }
  it { is_expected.to validate_presence_of(:card) }
  it { is_expected.to belong_to(:store) }
  it { is_expected.to allow_values(:debit, :slip, :mortgage, :credit, :loan, 
                                   :sales, :ted, :doc, :rent ).for(:type) }
end

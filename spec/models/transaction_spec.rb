require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to belong_to(:store) }
  it do
    expect(Transaction.new).to allow_values(:debit, :slip, :financing, :credit, :loan,
                                    :sales, :ted, :doc, :rent).for(:type)
  end
end

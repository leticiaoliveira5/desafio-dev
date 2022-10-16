class Store < ApplicationRecord
  belongs_to :cnab_file
  has_many :transactions, dependent: :destroy

  validates :owner, :name, presence: true

  attribute :balance, :float

  def balance
    total = transactions.sum(&:value)
    number_with_precision(total, precision: 2)
  end
end

class Store < ApplicationRecord
  belongs_to :cnab_file
  has_many :transactions, dependent: :destroy

  validates :owner, :name, presence: true

  attribute :balance, :float

  def balance
    total = transactions.sum(&:value)
    format('%<num>0.2f', num: total)
  end
end

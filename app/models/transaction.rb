class Transaction < ApplicationRecord
  belongs_to :store

  validates :type, :amount, presence: true

  enum type: { debit: 1, slip: 2, financing: 3, credit: 4, loan: 5,
               sales: 6, ted: 7, doc: 8, rent: 9 }

  def value
    type.in?(%w[debit credit loan sales ted doc]) ? amount : 0 - amount
  end
end

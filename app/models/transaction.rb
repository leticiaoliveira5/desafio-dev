class Transaction < ApplicationRecord
  belong_to :store
  belong_to :user, through: :store

  validates :type, :amount, presence: true

  enum type: { debit: 1, slip: 2, motgage: 3, credit: 4, loan: 5,
               sales: 6, ted: 7, doc: 8, rent: 9 }
end

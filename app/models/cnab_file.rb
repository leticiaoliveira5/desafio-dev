class CnabFile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :stores
  has_many :transactions, through: :stores
end

class CnabFile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :stores, dependent: :destroy
  has_many :transactions, through: :stores
end

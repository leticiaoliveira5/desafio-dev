class Store < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :owner, :name, presence: true
end

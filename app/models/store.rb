class Store < ApplicationRecord
  belongs_to :cnab_file
  has_many :transactions, dependent: :destroy

  validates :owner, :name, presence: true
end

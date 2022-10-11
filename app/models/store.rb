class Store < ApplicationRecord
  belongs_to :user

  validates :owner, :name, presence: true
end

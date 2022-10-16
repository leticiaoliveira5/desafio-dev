require 'faker'

FactoryBot.define do
  factory :transaction do
    type { 1 }
    sold_at { 2.days.ago }
    amount { 100.50 }
    document { '12345678910234' }
    card { '1111****1111' }
    store
  end
end

require 'faker'

FactoryBot.define do
  factory :store do
    name { Faker::Company.name }
    owner { Faker::Name.first_name }
    user { user }
  end
end

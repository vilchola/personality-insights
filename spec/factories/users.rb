FactoryBot.define do
  factory :todo do
    username { Faker::Lorem.word }
    trait { Faker::Lorem.word }
  end
end

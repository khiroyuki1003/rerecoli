FactoryBot.define do
  factory :category do
    category_name {Faker::Lorem.words(number: 1)}

    association :profile
  end
end
  
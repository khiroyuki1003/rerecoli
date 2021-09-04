FactoryBot.define do
  factory :profile do
    nickname {Faker::Name.name}
    birth_date {Faker::Date.between(from: '1930-1-1', to: '2021-8-27')}
    precious_word {Faker::Lorem.characters(number: 100)}

    association :user
  end
end 
 
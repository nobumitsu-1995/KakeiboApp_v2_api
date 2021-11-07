FactoryBot.define do
  factory :item do
    name { "example" }
    price { rand(100..100000) }
    date { rand(10..30).days.from_now }
    note { "example" }
    sequence(:user_id) { |i| "user_id#{i}" }
    association :category
    association :payment_method
  end
end

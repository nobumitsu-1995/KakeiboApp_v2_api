FactoryBot.define do
  factory :fixed_cost do
    name { "example" }
    price { rand(100..100000) }
    scheduled_date { rand(1..31) }
    note { "example" }
    sequence(:user_id) { |i| "user_id#{i}" }
    association :category
    association :payment_method
  end
end

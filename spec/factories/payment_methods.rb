FactoryBot.define do
  factory :payment_method do
    sequence(:name) { |i| "payment_method#{i}" }
    income { false }
    sequence(:user_id) { |i| "user_id#{i}" }
  end
end

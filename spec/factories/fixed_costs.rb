FactoryBot.define do
  factory :fixed_cost do
    name { "MyString" }
    price { 1 }
    scheduled_date { 1 }
    note { "MyString" }
    user_id { "MyString" }
    category { nil }
    payment_method { nil }
  end
end

FactoryBot.define do
  factory :item do
    name { "MyString" }
    price { 1 }
    date { "2021-11-07" }
    note { "MyString" }
    user_id { "MyString" }
    category { "" }
    payment_method { "" }
  end
end

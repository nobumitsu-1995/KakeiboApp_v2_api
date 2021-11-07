FactoryBot.define do
  factory :money_info do
    total_assets { 1 }
    target_amount { 1 }
    deadline { "2021-11-07" }
    user_id { "MyString" }
  end
end

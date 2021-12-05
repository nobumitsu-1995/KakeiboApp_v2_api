FactoryBot.define do
  factory :money_info do
    total_assets { rand(1000..9999) }
    target_amount { rand(10000..999999) }
    deadline { rand(300..900).days.from_now }
    monthly_budget { rand(100..900) }
    sequence(:user_id) { |i| "user_id#{i}" }
  end
end

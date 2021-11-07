FactoryBot.define do
  factory :category do
    sequence(:name) { |i| "category#{i}" }
    big_category  { rand(0..2) }
    sequence(:user_id) { |i| "user_id#{i}" }
  end
end

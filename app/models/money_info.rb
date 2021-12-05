class MoneyInfo < ApplicationRecord
    validates :total_assets, presence: true
    validates :user_id, presence: true, uniqueness: true
    validates :monthly_budget, presence: true
    validates :target_amount, presence: true
    validates :deadline, presence: true
end

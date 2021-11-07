class MoneyInfo < ApplicationRecord
    validates :total_assets, presence: true
    validates :user_id, presence: true, uniqueness: true
end

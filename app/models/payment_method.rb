class PaymentMethod < ApplicationRecord
    has_many :items
    has_many :fixed_costs
    validates :name, presence: true, length: {maximum: 50}, :uniqueness => {:scope => :user_id}
    validates :income, inclusion: { in: [true, false]}
end

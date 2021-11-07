class Category < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }, :uniqueness => {:scope => :user_id}
    validates :big_category, presence: true
    enum big_category: {
        fixed_cost: 0,
        variable_cost: 1,
        income: 2,
    } 
end

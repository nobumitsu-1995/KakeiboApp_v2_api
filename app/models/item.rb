class Item < ApplicationRecord
    belongs_to :category, optional: true
    belongs_to :payment_method, optional: true
    validates :name, presence: true, length: {maximum: 50}
    validates :price, presence: true
    validates :date, presence: true
    validates :note, length: {maximum: 200}
    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :payment_method_id, presence: true
end

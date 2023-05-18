class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items

    validates :name, presence: true
    validates :cost, presence: true
    validaets :description, presence: true
end

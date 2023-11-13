class Order < ApplicationRecord
  belongs_to :client

  has_many :order_items
  has_many :products, through: :order_items
  has_many :order_statements
  has_many :statements, through: :order_statements
end 
class Order < ApplicationRecord
  belongs_to :client

  has_many :order_items
  has_many :products, through: :order_items
  has_many :order_statements
  has_many :statements, through: :order_statements
  has_many :shifts
end

# order item corresponds to an invoice line: some quantity of products with a given total cost
class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  attr_accessor :quantity, :subtotal
end

# order statement ties an order to a statement, this allows for: multiple estimates to be generated for a given order
  # also allows for breaking down of an order in multiple invoices, or multiple payments
class OrderStatement < ApplicationRecord
  belongs_to :order
  belongs_to :statement
end
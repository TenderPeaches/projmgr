
# order item corresponds to an invoice line: some quantity of products with a given total cost
class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  has_many :shifts      
end
# has_many shifts instead of having each shift be a product or wtv; here shifts will be used to determine quantity
# can also do task-based breakdowns to show how much was spent on specific tasks
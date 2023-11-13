

# order statement ties an order to a statement, this allows for: multiple estimates to be generated for a given order
  # also allows for breaking down of an order in multiple invoices, or multiple payments
  class OrderStatement < ApplicationRecord
    belongs_to :order
    belongs_to :statement
  end
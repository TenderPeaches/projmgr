# need to implement:
    # simple accounting tasks:
        # estimate yearly revenue
        # estimate yearly expenses
        # emit invoice/receipt/estimate
            # idea: group as inheriting itemized_bill or transaction
                # (don't like transaction because it would imply that estimates, reeceipts are a transaction which they are not)
                # records? no too vague
                # itemized_statement? ok ish
                # what about transaction_items?
                    # Invoice belongs_to transaction_items
                    # Estimate belongs_to transaction_items
                    # Payment belongs_to transaction_items           (so these tables point to a transaction_items_id)
                        # Payment is also a transaction
                        # Estimate, Invoices are NOT transaction > They are statements
                            # a Receipt is not a transaction, it is also a statement
                        # Technically, Credit would also be a transaction but not necessary now
                        
# first draft

# statements are documents that are emitted for a given client
# they would consist of estimates, invoices and receipts
class Statement < ApplicationRecord
    has_many :recipients, class_name: "Contact" # who the statement is sent to
    has_one :order, through: :order_statements

    attr_accessor :sent_date        # date of emission
end

# "services" would be technically OK but using Product for clarity - what is being sold (a billable item)
class Product < ApplicationRecord
    has_many :order_items     

    attr_accessor :name, :cost, :description # cost == hourly_rate
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

# list of products that comprise an "order", a list of "products/services" that should comprise a single estimate/invoice/receipt
class Order < ApplicationRecord
    belongs_to :client              # points to the client

    has_many :products, through: :order_items
    has_many :statements, through: :order_statements
end

# a transaction happens only when money changes hands
    # it could logically point to an invoice, but won't be done now since not really necessary - clients pay off their total balance, regardless of specific invoices
class Transaction < ApplicationRecord
    has_one :client
end

# payment methods 
class PaymentMethod < ApplicationRecord
    has_many :payments
    attr_accessor :name, :notes
end

# client pay self/service provider
class Payment < Transaction
    belongs_to :payment_method
    belongs_to :client              # point towards the client, not a specific invoice - clients are paying off their total balance
    has_one :receipt                # do need a specific receipt for a given payment tho
end

# receipt is emitted when payment is made
class Receipt < Statement
    belongs_to :payment
end

# self/service provider pays client
class Credit < Transaction
    belongs_to :invoice, optional: true
end

# estimate is emitted before any payment is agreed upon
class Estimate < Statement
    has_one :order
end

# invoice is emitted when payment and orders are agreed for
class Invoice < Statement
    has_one :order
end

class ExpenseType < ApplicationRecord
    attr_accessor :name, :description
end
class Expense < ApplicationRecord
    belongs_to :expense_type

    attr_accessor :amount, :date_incurred, :proof
end

class AddAccountingTables < ActiveRecord::Migration[7.0]
    def change
    end
end
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

# statements are doucments that are emitted for a given client
# they would consist of estimates, invoices and receipts
class Statement < ApplicationRecord
    has_many :recipients            # who the statement is sent to
    
    has_one :transaction_item_list, as: :items

    attr_accessor :sent_date        # date of emission
end

# "services" would be technically OK but using Product for clarity - what is being sold
class Product < ApplicationRecord
    has_many :transaction_items     

    attr_accessor :name, :cost      # cost == hourly_rate
end

# transaction item corresponds to an invoice line: some quantity of products with a given total cost
class TransactionItem < ApplicationRecord
    belongs_to :product
    belongs_to :transaction_item_list
end

# list of items that might belong to a transaction
class TransactionItemList < ApplicationRecord
    belongs_to :items, polymorphic: true
    has_many :products, through: :transaction_items
end

class Transaction < AppilcationRecord
    has_one :client
end

class PaymentMethod < ApplicationRecord
    has_many :payments
    attr_accessor :name, :notes
end

# client pay self/service provider
class Payment < Transaction
    belongs_to :payment_method
    belongs_to :invoice
    has_one :receipt
end

class Receipt < Statement
    belongs_to :payment
end

# self/service provider pays client
class Credit < Transaction
    belongs_to :invoice, optional: true
end

class Estimate < Statement
end

class Invoice < Statement
end

class AddAccountingTables < ActiveRecord::Migration[7.0]
    def change
    end
end
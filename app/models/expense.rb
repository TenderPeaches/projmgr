# t.string :label 
# t.decimal :amount
# t.date :date_incurred
# t.references :expense_type
class Expense < Transaction
  belongs_to :expense_type
  
  attr_accessor :uid
end

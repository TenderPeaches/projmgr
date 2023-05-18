class Statement < ApplicationRecord
    belongs_to :recipient, class_name: "Contact" 
    has_one :order_statement

    validates :type, presence: true
    validates :order, presence: true             # need at least one order, can be empty
end

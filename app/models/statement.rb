class Statement < ApplicationRecord
    has_many :recipients, class_name: "Contact" 
    has_one :order, through: :order_statements

    validates :order, presence:true             # need at least one order, can be empty
end

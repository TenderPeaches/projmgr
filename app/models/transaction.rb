class Transaction < ApplicationRecord
    has_one :client
    
    validates :type, presence: true
    validates :amount, presence: true
end

class Transaction < ApplicationRecord
    validates :type, presence: true
    validates :amount, presence: true
end

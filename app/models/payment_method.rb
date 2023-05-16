class PaymentMethod < ApplicationRecord
    has_many :payments

    validates :name, presence: true
end

class Payment < Transaction
  belongs_to :payment_method
  belongs_to :client
end

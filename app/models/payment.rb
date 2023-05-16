class Payment < Transaction
  belongs_to :payment_method
  belongs_to :client
  has_one :receipt

  validates :client, presence: true
end

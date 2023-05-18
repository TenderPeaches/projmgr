class Credit < Transaction
    belongs_to :client

    validates :reason, presence: true
end

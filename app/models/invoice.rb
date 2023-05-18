class Invoice < Statement

  validates :due_date, presence: true
end

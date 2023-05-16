class Invoice < ApplicationRecord
  belongs_to :statement

  validates :due_date, presence: true
end

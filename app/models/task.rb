class Task < ApplicationRecord
    belongs_to :project
    has_one :task_category
    has_many :shifts
end

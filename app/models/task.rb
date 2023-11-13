class Task < ApplicationRecord
  belongs_to :task_category
  belongs_to :project
  has_many :shifts

  def name 
    task_category.name
  end
end

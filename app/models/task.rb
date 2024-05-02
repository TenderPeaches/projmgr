class Task < ApplicationRecord
  belongs_to :task_category
  belongs_to :project
  has_many :shifts

  def name
    task_category.name
  end

  def minutes_worked
    shifts.reduce(0) {|sum, shift| sum + shift.duration}
  end

  def hours_worked
    (minutes_worked / 60).round(2)
  end
end

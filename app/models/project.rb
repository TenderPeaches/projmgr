class Project < ApplicationRecord
  belongs_to :client
  has_many :tasks
  has_many :shifts, through: :tasks
  has_many :events

  # after_save :generate_tasks # not sure if implementing like this for now, don't debug - tasks can be created manually for now, not too much overhead

  def label           # string => use as a quickhand identifier
    "#%{id} - %{name}" % { id: id, name: name }
  end

  def hours_worked    # int => total hours worked on this project
    hours_worked = 0.0
    shifts.all.each do |shift|
      unless shift.duration.nil?
        hours_worked += shift.duration
      end
    end
    hours_worked
  end

  private
    def generate_tasks(project)       # when a project is created, tasks can be implicitly generated from the generic categories
      task_categories = TaskCategory.all
      task_categories.each do |task_category|q
        new_task = Task.create(task_category: task_category, project: project)
      end
    end


end

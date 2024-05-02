class Project < ApplicationRecord
  belongs_to :client
  has_many :tasks
  has_many :shifts, through: :tasks
  has_many :events

  scope :active, -> { where active: true }

  # after_save :generate_tasks # not sure if implementing like this for now, don't debug - tasks can be created manually for now, not too much overhead

  def label           # string => use as a quickhand identifier
    "#%{id} - %{name}" % { id: id, name: name }
  end

  def hours_worked    # int => total hours worked on this project
    minutes_worked = 0.0
    shifts.all.each do |shift|
      unless shift.duration.nil?
        minutes_worked += shift.duration
      end
    end
    minutes_worked.to_f / 60
  end

  def hours_billed
    minutes_billed = 0.0
    client.orders.each do |order|
      order.order_items.each do |item|
        item.shifts.each do |shift|
          minutes_billed += shift.duration
        end
      end
    end

    minutes_billed.to_f / 60
  end

  def pending_pay
    hours_billed * 100    #temp but true
  end

  def total_pay
    0  #temp but true
  end

  def hour_breakdown_by_task
    minutes_per_task = {}

    tasks.each do |task|
      minutes_per_task[task.id] = { 'name' => task.name, 'minutes' => 0 }
    end

    shifts.each do |shift|
      minutes_per_task[shift.task_id]['minutes'] += shift.duration
    end

    print minutes_per_task

    minutes_per_task
  end

  private
    def generate_tasks(project)       # when a project is created, tasks can be implicitly generated from the generic categories
      task_categories = TaskCategory.all
      task_categories.each do |task_category|q
        new_task = Task.create(task_category: task_category, project: project)
      end
    end


end

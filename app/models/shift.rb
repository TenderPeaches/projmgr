class Shift < ApplicationRecord
  belongs_to :task          # shift accomplishes part of a task
  belongs_to :order_item    # shift is being accounted for as part of a payable order

  attr_accessor :project_id, :task_category_id          # used to infer task_id

  before_validation do
    if self.task.nil?
      self.task = Task.where(task_category_id: :task_category_id).where(project_id: self.project_id).first # set task from project_id, task_category_id
    end
  end

  def self.update_duration      # update duration for all shifts when necessary
    Shift.all.each do |shift|
      if shift.duration.nil?    # ignore if duration is already set
        shift.update(duration: shift.get_duration) # deduce duration from starting and ending timestamps
      end
    end
  end

  def duration
    if start_dt && end_dt
      (end_dt - start_dt) / 60        # assume duration as end_time - start_time, in minutes
    else
      0
    end
  end

  # returns list of uninvoiced shifts - shifts that have not been tied to an invoice
  def get_uninvoiced # should this be here, or in a global concern for "finances" or "timekeeping"?

  end
end

class Shift < ApplicationRecord
  belongs_to :task

  attr_accessor :project_id, :task_category_id          # used to infer task_id

  before_validation do 
    self.task = Task.where(task_category_id: @task_category_id).where(project_id: @project_id).first # set task from project_id, task_category_id  
  end

  before_update do
    self.duration = (self.end - self.start) / 60        # assume duration as end_time - start_time, in minutes
  end
end
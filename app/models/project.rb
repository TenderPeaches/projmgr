class Project < ApplicationRecord
  belongs_to :client
  has_many :tasks
  has_many :shifts, through: :tasks
  has_many :events

  after_save :generate_tasks

  def label 
    "#%{id} - %{name}" % { id: id, name: name }
  end

  private
    def generate_tasks(project)
      task_categories = TaskCategory.all
      task_categories.each do |task_category|q
        new_task = Task.create(task_category: task_category, project: project)
      end
    end


end

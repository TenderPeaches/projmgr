class Project < ApplicationRecord
  belongs_to :client
  has_many :tasks
  has_many :shifts, through: :tasks
  has_many :events

  def label 
    "#%{id} - %{name}" % { id: id, name: name }
  end

  def tasks_hours_sum
    
  end
end

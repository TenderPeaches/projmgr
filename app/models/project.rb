class Project < ApplicationRecord
  belongs_to :client
  has_many :tasks
  has_many :events
end

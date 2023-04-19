class Project < ApplicationRecord
    belongs_to :client
    has_many :events
    has_many :tasks

    def active              # active projects

    end
end

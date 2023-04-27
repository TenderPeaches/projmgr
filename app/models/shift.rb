class Shift < ApplicationRecord
  belongs_to :task

  before_update do
    self.duration = (self.end - self.start) / 60
  end
end
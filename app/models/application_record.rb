class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def to_s
      return self.name if self.has_attribute? :name
      return self.label if self.has_attribute? :label
      return "#{self.class.model_name.human} ##{self.id}"
  end
end

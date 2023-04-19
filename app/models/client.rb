class Client < ApplicationRecord
    has_many_and_belongs_to :contacts
    has_many :projects
end

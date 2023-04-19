class Client < ApplicationRecord
    belongs_to :contact
    has_many :projects
    has_many :contacts
end

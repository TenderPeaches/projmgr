class Client < ApplicationRecord
    has_many :client_contacts
    has_many :contacts, through: :client_contacts
    accepts_nested_attributes_for :contacts
    has_many :projects
    has_many :orders

    def to_s
        self.company_name
    end
end

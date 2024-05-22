class Contact < ApplicationRecord
    has_many :client_contacts
    has_many :clients, through: :client_contacts
    accepts_nested_attributes_for :clients

    def name
        "#{first_name} #{last_name}"
    end
end

module Contacts
    class Creator
        def initialize(client_id: nil)
            @client_id = client_id
        end

        def build(contact_params = {})
            @contact = Contact.new(default_contact_params(contact_params))
            @contact.client_contacts << @contact.client_contacts.build(client_id: @client_id)
            @contact
        end

        def create(contact_params = {})
            @contact = Contact.create(default_contact_params(contact_params))
            ClientContact.create(client_id: @client_id, contact_id: @contact.id)
        end

        private
        def default_contact_params(contact_params = {})
            {}.merge contact_params
        end
    end
end

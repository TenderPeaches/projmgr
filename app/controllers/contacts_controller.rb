class ContactsController < ApplicationController
    def show
        set_contact
    end

    def new
        # the client_id is implied from the request Path, as contacts are basically created from clients (even though a contact might represent multiple clients, they all start with a single client assigned to them)
        # it's only stored separately so as to be easily accessible from the view, which sends it along with the submitted contact form so that the creator knows which client to assign this contact to
        @client_id = params[:client_id]


        # test
        # given some params of parent models
        @parents = { parent_id: 0, client_id: 0 }
        # need to nest form
        @parent_classes = []

        @parents.each do |parent, id|
            @parent_classes << parent.match(/([\w]+(_[\w]+)*)_id/)[1].camelize
        end


        @contact = Contacts::Creator.new.build

    end

    def create
        # when creating the client, the request should include a client_id parameter matching the client to which this contact will first be assigned, if nil, the contact is still created but isn't assigned to any clients
        @contact = Contacts::Creator.new(client_id: params[:client_id]).create(contact_params)
    end

    def edit
        set_contact
    end

    def update
        set_contact
        @contact.update(contact_params)
    end

    def destroy
        set_contact
        @contact.destroy
    end

    private
    def set_contact
        @contact = Contact.find_by_id(params[:id] || params[:contact_id])
    end

    def contact_params
        params.require(:contact).permit(:first_name, :last_name, :email, :phone, :notes, :client_id)
    end

    def nested_form_builder_for form, *nested_attributes, &block
        attribute, index = nested_attributes.flatten!.shift(2)

        if attribute.blank?
            # yield the last form builder to render the response
            yield form
            return
        end

        association = attribute.chomp "_attributes"
        child_index = index || Process.clock_gettime(Process::CLOCK_REALTIME, :millisecond)

        form.fields_for association, association.classify.constantize.new, child_index: do |association_form|
            nested_form_builder_for(association_form, nested_attributes, &block)
        end
    end
end

class ModelFormBuilder < ActionView::Helpers::FormBuilder

    delegate :tag, :safe_join, to: :@template

    def field(attribute, options = {})
        @form_options = options
        object_type = object_type_for_attribute(attribute)

        input_type = case object_type
            when :date then :string
            when :integer then :string
            else object_type
        end

        override_input_type = if options[:as]
            options[:as]
        elsif options[:collection]
            :select
        end

        send("#{override_input_type || input_type}_input", attribute, options)
    end

    def radio_buttons_field(attribute, options = {})
        collection_of(:radio_buttons, attribute, options)
    end

    def check_boxes_field(attribute, options = {})
        collection_of(:check_boxes, attribute, options)
    end

    def dynamic_submodel_fields association
        options = {
            associated_class: object.class.reflect_on_association(association).klass,
            partial:
        }
    end

    # for associations that point towards a single member (1->1 or n->1)
    def dynamic_single_submodel_fields

    end

    # for associations that point towrads multiple members (1->n)
    def dynamic_multiple_submodel_fields

    end

    def associated_fields_for association, add_label = nil, partial: nil, path: nil

        @template.tag.div id: field_id(association) do
            fields_for association do |association_form|
                @template.render(partial, form: association_form)
            end
        end.concat(@template.link_to add_label, path, data: { turbo_stream: true })
    end

    # if the object is associated to other models, they can have their own subsection of a form
    # the subsection typically includes:
    #   * a selection input for the submodel:
    #       usually a Select or Radio Buttons for single associations, select or checkboxes or custom components for multiple
    #       for now this is kept outside of this form builder, could be added here
    #   * an "add [model]" button in case the user can add the given model and the intended model does not exist yet
    #   * a space for the submodel's form, which is displayed only as necessary
    def associated_model_subform_anchor association, options: {}

        options.assert_valid_keys(:partials, :add_label, :add_path, :format)
        options = associated_model_subform_options(association).merge(options)

        # the whole subform will exist within a turbo_frame (can be made a div if it turns out not te be necessary, but at least it will only need to be changed here)
        @template.turbo_frame_tag model_html_id(association) do
            # contents of the subform
            safe_join [
                # an empty "client-title" ID div, to be filled with the subform title once expanded
                @template.tag.div(id: model_html_id(association, :title)),
                # an empty "client-form" ID div, to be filled with the subform fields once expanded
                @template.tag.div(id: model_html_id(association, :form)),
                # an "Add Client" button, to expand the subform when clicked in order to allow the user to create a new submodel alongside the original model
                @template.link_to(options[:add_options][:label], options[:add_options][:path], class: "button", data: { turbo_stream: true })
            ]
        end
    end

    def associated_model_subform association
        fields_for association do |association_form|
            @template.render("#{association_class.model_name.collection}/fields", form: association_form)
        end
    end

    private
    def cached_helpers
        Class.new do
            include Rails.application.routes.url_helpers
            include Rails.application.routes.mounted_helpers
        end.new
    end

    def model_html_id(model, suffix = "")
        html_id = if model.is_a? String
            model.kebabcase
        elsif model.is_a? ActiveRecord::Base || model.respond_to?(model_name)
            model.model_name.singular.kebabcase
        else
            model.to_s.kebabcase
        end

        # model-suffix, or only model if no suffix is provided
        "#{html_id}#{suffix.present? ? "-#{suffix.to_s.kebabcase}" : ""}"
    end

    # attribute_names, index?
    def associated_model_subform_options(association, name = nil)
        association_class = object.class.reflect_on_association(association).klass
        partial = "#{association_class.model_name.collection}/fields"
        add_options = {
            label: "New #{association_class.model_name.human}",
            #path: "#{association_class.model_name.collection}/new?name=#{field_name()}"
            path: cached_helpers.send("new_#{association_class.model_name.singular}_path", name: name || field_name(association))
        }

        return { association_class:, partial:, add_options: }
    end

=begin
    # attribute_names, index?
    def associated_model_subform_options(association, field_name = "")
        association_class = object.class.reflect_on_association(association).klass
        partial = "#{association_class.model_name.collection}/fields"
        add_options = {
            label: "New #{association_class.model_name.human}",
            #path: "#{association_class.model_name.collection}/new?name=#{field_name()}"
            path: public_send("new_#{association_class.model_name.singular}_path(name: #{field_name(association)})")
        }

        return { association_class:, partial:, add_options: }
    end
=end

    def object_type_for_attribute(attribute)
        # if @object defines an attribute
        result = if @object.respond_to?(:type_for_attribute) && @object.has_attribute?(attribute)
            # return attribute type
            @object.type_for_attribute(attribute.to_s).try(:type)
        # else if @object matches a column
        elsif @object.respond_to?(:column_for_attribute) && @object.has_attribute?(attribute)
            @object.column_for_attribute(attribute).try(:type)
        end

        result || :string
    end

    ## inputs and helpers

    def string_input(attribute, options = {})
        field_block(attribute, options) do
            safe_join [
                (field_label(attribute, options[:label]) unless options[:label] == false),
                string_field(attribute, merge_input_options({class: "#{"is-invalid" if has_error?(attribute)}"}, options[:input_html])),
            ]
        end
    end

    def text_input(attribute, options = {})
        field_block(attribute, options) do
            safe_join [
            (field_label(attribute, options[:label]) unless options[:label] == false),
            text_area(attribute, merge_input_options({class: "#{"is-invalid" if has_error?(attribute)}"}, options[:input_html])),
            ]
        end
    end

    def boolean_input(attribute, options = {})
        field_block(attribute, options) do
            tag.div(class: "checkbox-field") do
            safe_join [
                check_box(attribute, merge_input_options({class: "checkbox-input"}, options[:input_html])),
                label(attribute, options[:label], class: "checkbox-label"),
            ]
            end
        end
    end

    def collection_input(attribute, options, &block)
        field_block(attribute, options) do
            safe_join [
                label(attribute, options[:label]),
                block.call,
            ]
        end
    end

    def select_input(attribute, options = {})

        value_method = options[:value_method] || :id
        text_method = options[:text_method] || :name
        input_options = options || {}

        multiple = input_options[:multiple]

        collection_input(attribute, options) do
            collection_select(attribute, options[:collection], value_method, text_method, options[:select_options] || {}, merge_input_options({class: "#{"custom-select" unless multiple} #{"is-invalid" if has_error?(attribute)}"}, options[:input_html]))
        end
    end

    def grouped_select_input(attribute, options = {})

        # We probably need to go back later and adjust this for more customization
        collection_input(attribute, options) do
        grouped_collection_select(attribute, options[:collection], :last, :first, :to_s, :to_s, options, merge_input_options({class: "custom-select #{"is-invalid" if has_error?(attribute)}"}, options[:input_html]))
      end
    end

    def file_input(attribute, options = {})
        field_block(attribute, options) do
            safe_join [
                (field_label(attribute, options[:label]) unless options[:label] == false),
                custom_file_field(attribute, options),
            ]
        end
    end

    def collection_of(input_type, attribute, options = {})
        form_builder_method, custom_class, input_builder_method = case input_type
            when :radio_buttons then [:collection_radio_buttons, "radio", :radio_button]
            when :check_boxes then [:collection_check_boxes, "checkbox", :check_box]
            else raise "Invalid input_type for collection_of, valid input_types are \":radio_buttons\", \":check_boxes\""
        end

        field_block(attribute, options) do
            safe_join [
                field_label(attribute, options[:label]),
                tag.div(class: "#{custom_class}-list") {
                    (send(form_builder_method, attribute, options[:collection], options[:value_method], options[:text_method]) do |b|
                        tag.div(class: "#{custom_class}") {
                            safe_join [
                            b.send(input_builder_method, class: "#{custom_class}-input"),
                            b.label(class: "#{custom_class}-label"),
                            ]
                        }
                    end)
                },
            ]
        end
    end

    def string_field(attribute, options = {})
        case object_type_for_attribute(attribute)
        when :date then
            safe_join [
                date_field(attribute, merge_input_options(options, {data: {datepicker: true}})),
                tag.div {
                    date_select(attribute, {
                            order: [:year, :month, :day],
                            start_year: Date.today.year,
                            end_year: Date.today.year,
                        }, {data: {date_select: true}})
                },
            ]
        when :integer then number_field(attribute, options)
        when :string
            case attribute.to_s
            when /password/ then password_field(attribute, options)
            # when /time_zone/ then :time_zone
            # when /country/   then :country
            when /email/ then email_field(attribute, options)
            when /phone/ then telephone_field(attribute, options)
            when /url/ then url_field(attribute, options)
            else
                text_field(attribute, options)
            end
        end
    end

    def field_block(attribute, options = {}, &block)
        tag.div class: "field #{attribute}" do
            safe_join [
                block.call,
                hint_text(options[:hint]),
                error_text(attribute),
            ].compact
        end
    end

    def field_label(attribute, options = {})
        label(attribute, options)
    end

    def hint_text(text)
        unless text.nil?
            tag.small text, class: "hint hint--form"
        end
    end

    def error_text(attribute)
        if has_error? attribute
            tag.div @object.errors[method].join("<br />").html_safe, class: "form-errors"
        end
    end

    def has_error?(attribute)
        return false unless @object.respond_to?(:errors)
        @object.errors.key?(attribute)
    end

    def merge_input_options(options, user_options)
        return options if user_options.nil?

        # TODO handle class merging here
        options.merge(user_options)
    end
end

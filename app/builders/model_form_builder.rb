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

    private
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

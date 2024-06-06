
module ModelsHelper
    # base_path: the model's CRUD base path as an URL string, like the result of article_path(:id)
    def model_edit_delete_actions(base_path, options = {})
        [
            # edit model button
            model_edit_action(base_path, options[:edit_label]),
            # delete model button
            model_delete_action(base_path, options[:delete_label])
        ].join('').html_safe
    end

    def model_edit_action(base_path, label = nil)
        #! maybe there's a safer way to do the route but this works as long as rails routing naming conventions hold
        turbo_link_button(label || t('keywords.edit'), "#{base_path}/edit")
    end

    def model_delete_action(base_path, label = nil)
        turbo_link_button(label || t('keywords.delete'), base_path, method: :delete )
    end

    def model_new_action(base_path, label = nil)
        turbo_link_button(label || t('keywords.new'), "#{base_path}/new")
    end

    def model_cancel_form_button(base_path, label = nil)
        turbo_link_button(label || t('keywords.cancel'), "#{base_path}/0")
    end

    def model_submit_button(form, label = nil)
        label = label || "#{(form.object.new_record? ? "Create" : "Update")} #{form.object.class.to_s}"
        form.submit label
    end

    def model_title(model)
        "#{model.class.model_name.singular.kebabcase}-title"
    end

    def model_form_for(name, *args, &block)
        # set ModelFormBuilder as the form builder
        options = args.extract_options!.merge(builder: ModelFormBuilder)

        if options.has_key? :class
            options[:class] << " form"
        else
            options[:class] = "form"
        end

        options[:html] = { class: options[:class] }

        args << options

        form_for(name, *args, &block)
    end

    def model_form_with(model: nil, scope: nil, url: nil, format: nil, **options, &block)
        options = options.reverse_merge(builder: ModelFormBuilder)
        form_with(model: model, scope: scope, url: url, format: format, class: "form#{(options.has_key? :class) ? " #{options[:class]}" : ""}", **options, &block)
    end

    def model_form_name(model)
        if model.is_a? ActiveRecord::Base
            model_class = model
        else
            model_class = model.class
        end

        "#{model_class.model_name.singular.kebabcase}-form"
    end

    # association => the submodel instance (like Client.new, for a Project.new.client form, for instance)
    # form_name => a string that matches the input elements HTML name attribute, like "project[client][contacts][0][coordinate]"
    def model_association_form(form_name = "")
        # isolate the original model class from the submodels
        form_model, *nested_attributes = form_name.split(/\[|\]/).compact_blank

        # simulate the top-level form using a new instance of form_model
        fields form_model.classify.constantize.new do |form|
            # recursively build the subforms, going as deep as needed to reach the association model form
            nested_form_builder_for form, nested_attributes do |nested_form|
                # run once for the last iteration (the association model)
                return nested_form
            end
        end
    end

    private
    def nested_form_builder_for form, *nested_attributes, &block

        # fetch the attribute and potential index from the nested attributes
        attribute, index = nested_attributes.flatten!.shift(2)

        if attribute.blank?
            # if running out of attributes, render the last form builder instance to generate the response
            yield form
            return
        end

        # get the assoication from the attribute name, if applicable
        association = attribute.chomp("_attributes")

        # set the index, generate a unique one if none was provided in the nested attributes
        child_index = index || Process.clock_gettime(Process::CLOCK_REALTIME, :millisecond)

        form.fields_for association, association.classify.constantize.new, child_index: do |association_form|
            nested_form_builder_for association_form, nested_attributes, &block
        end
    end
end

ActionView::Base.send :include, ModelsHelper

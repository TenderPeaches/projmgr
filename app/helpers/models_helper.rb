
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

    def model_edit_action(base_path, label = t('keywords.edit'))
        #! maybe there's a safer way to do the route but this works as long as rails routing naming conventions hold
        turbo_link_button(label, "#{base_path}/edit")
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
        "#{model.class.model_name.plural.kebabcase}-title"
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
end

ActionView::Base.send :include, ModelsHelper

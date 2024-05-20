
module ModelsHelper
    # base_path: the model's CRUD base path as an URL string, like the result of article_path(:id)
    def model_edit_delete_actions(base_path)
        [
            # edit model button
            model_edit_action(base_path),
            # delete model button
            model_delete_action(base_path)
        ].join('').html_safe
    end

    def model_edit_action(base_path)
        #! maybe there's a safer way to do the route but this works as long as rails routing naming conventions hold
        turbo_link_button(t('keywords.edit'), "#{base_path}/edit")
    end

    def model_delete_action(base_path)
        turbo_link_button(t('keywords.delete'), base_path, method: :delete )
    end

    def model_cancel_form_button(base_path)
        turbo_link_button(t('keywords.cancel'), "#{base_path}/0")
    end

    def model_submit_button(form)
        form.submit "#{form.object.new_record? ? "Create" : "Update"} #{form.object.class.to_s}"
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

    ## these ones shouldn't be in pxs-forms (or should they? maybe to consolidate them - TBD)
=begin
    def model_update(model_class)
        turbo_stream.update :title, Client.model_name.human(count: 2)
<%= turbo_stream.update :form %>
=end
end

ActionView::Base.send :include, ModelsHelper

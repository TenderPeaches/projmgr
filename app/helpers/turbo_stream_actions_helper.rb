module TurboStreamActionsHelper
    # this tries to update the first target; if it's not in the DOM, targets are updated instead
    #! this should be a layer over the stream_element that picks the target depending on whether it's in the DOM or not. Instead, we're implementing it on a use-case basis. For now, only the update action is required
    def update_whichever(target, alt, content = nil, **rendering, &block)
        # assert that the targets are valid HTML selector
        target = assert_is_html_selector(target)
        alt = assert_is_html_selector(alt)

        # render the template
        template = render_template(target, content, **rendering, &block)

        turbo_stream_action_tag :update_whichever, target: target, alt: alt, template: template
    end

    private
    # can object be a valid HTML selector, like .button, #form
    def is_html_selector?(object)
        object.to_s.match?(/[\.#][\w-]+/)
    end

    # returns a valid HTML selector from object, whether it already is one or not
    def assert_is_html_selector(object)
        if is_html_selector? object
            return object.to_s.kebabcase
        else
            # assume ID, default to #object
            return "##{object.to_s.kebabcase}"
        end
    end

    # see https://github.com/hotwired/turbo-rails/blob/e376852bfb273f69f4ebb54cf516b99fcbaa7acb/app/models/turbo/streams/tag_builder.rb#L158
    def render_template(target, content = nil, allow_inferred_rendering: true, **rendering, &block)
        case
        when content.respond_to?(:render_in)
          content.render_in(@view_context, &block)
        when content
          allow_inferred_rendering ? (render_record(content) || content) : content
        when block_given?
          @view_context.capture(&block)
        when rendering.any?
          @view_context.render(formats: [ :html ], **rendering)
        else
          render_record(target) if allow_inferred_rendering
        end
    end
    def render_record(possible_record)
      if possible_record.respond_to?(:to_partial_path)
        record = possible_record
        @view_context.render(partial: record, formats: :html)
      end
    end
end

Turbo::Streams::TagBuilder.prepend(TurboStreamActionsHelper)

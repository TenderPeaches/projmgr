module LinksHelper

    def turbo_link_button(text, target, options = {})
        link_to text, target, class: "button#{options[:class] ? " #{options[:class]}" : ""}", data: { turbo_stream: true, turbo_method: options[:method] || :get }, id: options[:id]
    end

    def link_button_to(text, target, options = {})
        link_to text, target, class: "button" + (options[:class] ? " #{options[:class]}" : ""), method: options[:method] || :get, id: options[:id]
    end
end

ActionView::Base.send :include, LinksHelper

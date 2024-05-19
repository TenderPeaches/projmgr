
        module LinksHelper
            def turbo_link_button(text, target, method = :get)
                link_to text, target, class: "button", data: { turbo_stream: true, turbo_method: method }
            end

            def link_button_to(text, target, method = :get)
                link_to text, target, class: "button", method: method
            end
        end

ActionView::Base.send :include, LinksHelper

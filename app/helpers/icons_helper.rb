module IconsHelper
    def turbo_icon(label, path, options = {})
        turbo_link_button label, path, options.merge({class: "icon"})
    end

    def icon(name)
        show_svg("icons/#{name}")
    end

    def show_svg(path)
        File.open("app/assets/images/#{path}.svg", "rb") do |file|
            raw file.read
        end
    end

    def icon_edit
        icon(:edit)
    end

    def icon_delete
        icon(:trash)
    end
end

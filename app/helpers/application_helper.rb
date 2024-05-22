module ApplicationHelper
    def monetize(amount)
        number_to_currency(amount, precision: 2, unit: "$")
    end

    def date_format(date)
        date.strftime("%Y-%m-%d")
    end

    # see locales .yml files, under category "actions"
    def action_label(action, object = "")
        # translation_label, must be a valid key from the t() locales
        t_label = "actions.#{action.to_s}"
        if I18n.exists?(t_label, I18n.locale)
            t("actions.#{action.to_s}", thing: object)
        end
    end

    # define a {label: "...", value: "..."} hash
    def data_pair(label, value)
        { label: label, value: value }
    end
end

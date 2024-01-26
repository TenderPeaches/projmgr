module ApplicationHelper
    def monetize(amount)
        number_to_currency(amount, precision: 2, unit: "$")
    end 

    def date_format(date)
        date.strftime("%Y-%m-%d")
    end
end

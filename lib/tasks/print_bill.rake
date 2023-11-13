
namespace :print_bill do
    desc "Exports current dictionary to Rails seeds"

    task :for_order, [:order_id] => :environment do |task, args|
        order_id = args[:order_id]
        throw "need [order_id]" if order_id.nil?

        data = { :shifts => Shift.where(order_item_id: order_id) }
        data[:total_hours_worked] = data[:shifts].sum(:duration).to_f / 60.0
        data[:product] = Product.regular_dev
        data[:hourly_rate] = data[:product].cost
        data[:total_rate] = (total_hours_worked * hourly_rate).round(2).to_i

        print_text(data) if [args[:output_type].nil?]
    end

    def set_values(order_id)




    end

    def print_html(data)
        data[:shifts].each do |shift|
            puts "#{shift.start_dt.strftime("%D")} > #{shift.start_dt.strftime("%T")} - #{shift.end_dt.strftime("%T")} (#{shift.duration} min.): #{shift.notes}"
        end
        puts "Total hours worked: #{data[:total_hours_worked]}"
        puts "Hourly rate: $#{data[:hourly_rate]}"
        puts "Total rate: $#{data[:total_rate]}"
    end 

    def print_text(order_id)
        throw "need [order_id]" if order_id.nil?
        shifts = Shift.where(order_item_id: order_id) 
        total_hours_worked = shifts.sum(:duration).to_f / 60.0
        product = Product.regular_dev
        hourly_rate = product.cost
        total_rate = (total_hours_worked * hourly_rate).round(2).to_i
        shifts.each do |shift|
            puts "#{shift.start_dt.strftime("%D")} > #{shift.start_dt.strftime("%T")} - #{shift.end_dt.strftime("%T")} (#{shift.duration} min.): #{shift.notes}"
        end
        puts "Total hours worked: #{total_hours_worked}"
        puts "Hourly rate: $#{hourly_rate}"
        puts "Total rate: $#{total_rate}"
    end
end

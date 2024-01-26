class ExpenseType < ApplicationRecord

    def self.for_select
        ExpenseType.all
    end
end

class FinancesController < ApplicationController
    def index
        @
    end

    private
        def summary
            @uninvoiced_hours = nil # get hours worked that haven't been invoiced
            @unpaid_invoices = nil  # $ invoiced not paid
            @paid_yearly_income = nil # $ paid this year
        end
  end
  
class ApplicationController < ActionController::Base
    default_form_builder ModelFormBuilder

    def set_form_name
        @form_name = params[:name]
    end
end

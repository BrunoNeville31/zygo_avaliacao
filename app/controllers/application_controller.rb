class ApplicationController < ActionController::Base
    layout :set_layout

    def set_layout
        if devise_controller?
            "#{resource_class.name.downcase}_devise"
        end
    end
end

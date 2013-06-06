module ApplicationHelper
    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end
    
    def common_block header
      render partial: "shared/block", locals: {header: header, content: yield}
    end
end

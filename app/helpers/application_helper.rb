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
    
    def enought_money? action
      if current_user.account.total >= Variables.where(key: action.to_s).first_or_create(value: 10).value.to_f 
        return true
      end
      false
    end
    
    def b(value)
            value ? "Да" : "Нет"
    end
end

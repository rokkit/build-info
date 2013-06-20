class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [:create ]
  def new
      super
    end

    def create
      # add custom create logic here
      super
      self.resource
      self.resource.roles << Role.find_by_name(params[:user][:user_type])
      self.resource.save!
    end

    def update
      super
    end
end
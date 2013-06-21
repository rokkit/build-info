class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [:create ]
  def new
      super
    end

    def create
      # add custom create logic here
      super
      self.resource
      # generated_password = Devise.friendly_token.first(8)
#       self.resource.password = generated_password
      # client = Twilio::REST::Client.new(APP['twilio']['sid'], APP['twilio']['token'])
      # client.account.sms.messages.create(
      #   from: APP['twilio']['from'],
      #   to: "+#{self.resource.phone}",
      #   body: "#{generated_password}"
      # )
      # InformMailer.inform(self, message).deliver 
      self.resource.roles << Role.find_by_name(params[:user][:user_type])
      self.resource.save!
    end

    def update
      super
    end
end
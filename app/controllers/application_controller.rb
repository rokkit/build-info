class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  protect_from_forgery
  before_filter :set_locale
 
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def authenticate_admin_user!
    authenticate_user! 
    unless current_user.role? :admin
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path 
    end
  end
 
  def current_admin_user
    #return nil if user_signed_in? && !current_user.admin?
    current_user
  end
end

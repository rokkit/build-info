class CustomFailure < Devise::FailureApp
  def redirect_url
    #if warden_options[:scope] == :user 
        root_path 
    # else 
    #     new_admin_user_session_path 
    # end
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      flash[:notice] = I18n.t(:unauthenticated, :scope => [ :devise, :failure ])
      redirect
    end
  end
end
ActiveAdmin.register Agency do
  action_item only: :show do
        link_to "Подтвердить", approve_admin_agency_path(agency), method: :post if agency.confirmed_at.nil?
  end
  member_action :approve, :method => :post do
    # Just a regular controller method in here
    user = Agency.find params[:id]
    user.approve!
    redirect_to admin_agency_path(user)
  end
end

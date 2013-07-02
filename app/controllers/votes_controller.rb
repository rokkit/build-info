class VotesController < InheritedResources::Base
  actions :create, :destroy
  
  def create
    current_user.likes params[:vote][:likeable_object].constantize.find(params[:vote][:likeable_id])
    respond_to do |format|
      format.js
    end
  end
end
class AgenciesController < InheritedResources::Base
  def create
      @agency = Agency.new(params[:agency])
      @agency.owner = current_user
      create!
    end
end

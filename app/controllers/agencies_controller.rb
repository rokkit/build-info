# encoding: UTF-8
class AgenciesController < InheritedResources::Base
  def index
    @agencies = Agency.where("confirmed_at IS NOT NULL")
  end
  def create
      @agency = Agency.new(params[:agency])
      @agency.owner = current_user
      @agency.agents << current_user
      current_user.agency = @agency
      current_user.save
      create! :notice => "Агенство успешно зарегистрировано и будет доступно после проверки администрацией ресурса"
  end
  def agents
    @agents = current_user.agency.agents
  end
end

# encoding: UTF-8
class AgenciesController < InheritedResources::Base
  def create
      @agency = Agency.new(params[:agency])
      @agency.owner = current_user
      create! :notice => "Агенство успешно зарегистрировано и будет доступно после проверки администрацией ресурса"
    end
end

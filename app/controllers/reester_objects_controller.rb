class ReesterObjectsController < InheritedResources::Base
  def find
    distinct = Distinct.find(params[:distinct])
    ro = ReesterObject.where(distinct_id: distinct)
    street = Street.find(params[:street])
    ro = ro.where(["address LIKE :address", address: "%#{street.name}, дом #{params[:number_house]}%"])
    ro = ro.where(apartement_number: params[:apartement_number]).first
    respond_to do |format|
      format.json { render json: ro  }
    end
  end
end

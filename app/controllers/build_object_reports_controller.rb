class BuildObjectReportsController < ApplicationController

  def index
    @grid = BuildObjectReportsGrid.new(params[:build_object_reports_grid])
    @assets = @grid.assets.page(params[:page])
    
    @build_objects = BuildObject.scoped
#     unless params[:filter].blank?
#       @build_objects.filter_country(params[:filter][:country_id]) unless params[:filter][:country_id].blank?
#     end
    @build_objects.filter_country(4)
  end

end


class BuildObjectReportsController < ApplicationController

  def index
    @grid = BuildObjectReportsGrid.new(params[:build_object_reports_grid])
    @assets = @grid.assets.page(params[:page])
    
    @build_objects = BuildObject.scoped
    unless params[:filter].blank?
      @build_objects = @build_objects.filter_country params[:filter][:country_id] unless params[:filter][:country_id].blank?
      @build_objects = @build_objects.filter_region params[:filter][:region_id] unless params[:filter][:region_id].blank?
      @build_objects = @build_objects.filter_city params[:filter][:city_id] unless params[:filter][:city_id].blank?
      @build_objects = @build_objects.filter_distinct params[:filter][:distinct_id] unless params[:filter][:distinct_id].blank?
      @build_objects = @build_objects.filter_street params[:filter][:street_id] unless params[:filter][:street_id].blank?
    end
  end

end


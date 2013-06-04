class BuildObjectReportsController < ApplicationController

  def index
    @grid = BuildObjectReportsGrid.new(params[:build_object_reports_grid])
    @assets = @grid.assets.page(params[:page])
  end

end


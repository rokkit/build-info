class BuildObjectController < ApplicationController
  def index
    @build_objects = House.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @build_objects }
    end
  end

  def show
  end
end

class BuildObjectsController < ApplicationController
  # GET /build_objects
  # GET /build_objects.json
  def index
    @build_objects = BuildObject.scoped.full
    unless params[:filter].blank?
      @build_objects = @build_objects.filter_country params[:filter][:country_id] unless params[:filter][:country_id].blank?
      @build_objects = @build_objects.filter_region params[:filter][:region_id] unless params[:filter][:region_id].blank?
      @build_objects = @build_objects.filter_city params[:filter][:city_id] unless params[:filter][:city_id].blank?
      @build_objects = @build_objects.filter_distinct params[:filter][:distinct_id] unless params[:filter][:distinct_id].blank?
      @build_objects = @build_objects.filter_street params[:filter][:street_id] unless params[:filter][:street_id].blank?
      @build_objects = @build_objects.filter_min_price params[:filter][:min_price] unless params[:filter][:min_price].blank?
      @build_objects = @build_objects.filter_max_price params[:filter][:max_price] unless params[:filter][:max_price].blank?
      @build_objects = @build_objects.filter_min_area params[:filter][:min_area] unless params[:filter][:min_area].blank?
      @build_objects = @build_objects.filter_max_area params[:filter][:max_area] unless params[:filter][:max_area].blank?
      @build_objects = @build_objects.filter_ipoteka params[:filter][:ipoteka] unless params[:filter][:ipoteka].blank?
    end
  end

  # GET /build_objects/1
  # GET /build_objects/1.json
  def show
    @build_object = BuildObject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @build_object }
    end
  end

  # GET /build_objects/new
  # GET /build_objects/new.json
  def new
    @build_object = BuildObject.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @build_object }
    end
  end

  # GET /build_objects/1/edit
  def edit
    @build_object = BuildObject.find(params[:id])
  end

  # POST /build_objects
  # POST /build_objects.json
  def create
    @build_object = BuildObject.new(params[:build_object])
    @build_object.user = current_user
    respond_to do |format|
      if @build_object.save
        format.html { redirect_to @build_object, notice: 'Объект успешно добавлен' }
        format.json { render json: @build_object, status: :created, location: @build_object }
      else
        format.html { render action: "new" }
        format.json { render json: @build_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /build_objects/1
  # PUT /build_objects/1.json
  def update
    @build_object = BuildObject.find(params[:id])
    @build_object.user = current_user
    respond_to do |format|
      if @build_object.update_attributes(params[:build_object])
        format.html { redirect_to @build_object, notice: 'Build object was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @build_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /build_objects/1
  # DELETE /build_objects/1.json
  def destroy
    @build_object = BuildObject.find(params[:id])
    @build_object.archive!

    respond_to do |format|
      format.html { redirect_to build_objects_url }
      format.json { head :no_content }
    end
  end
end

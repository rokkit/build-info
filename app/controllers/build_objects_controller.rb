class BuildObjectsController < ApplicationController
  impressionist
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /build_objects
  # GET /build_objects.json
  def index
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: BuildObjectsDatatable.new(view_context, :public_objects)  }
    end
  end
  
  def invest_projects
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: BuildObjectsDatatable.new(view_context, :invest_projects)  }
    end
  end
  
  def manage
    @build_objects = current_user.build_objects
  end

  # GET /build_objects/1
  # GET /build_objects/1.json
  def show
    @build_object = BuildObject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @build_object }
      format.pdf do
         report = BuildObjectReport.new(@build_object, view_context).to_pdf
         send_data report, filename: "#{@build_object.name}_#{report}.pdf", type: "application/pdf", disposition: "inline" 
      end
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
    if current_user.account.total < Variables.find_by_name("create_build_object").to_f
      
    end
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

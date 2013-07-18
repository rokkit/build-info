class BuildObjectsController < ApplicationController
  impressionist
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :views_limit, only: :show
  # GET /build_objects
  # GET /build_objects.json
  def index
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: BuildObjectsDatatable.new(view_context, :public_objects)  }
    end
  end
  
  def invest_projects
    authorize! :invest, :all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: BuildObjectsDatatable.new(view_context, :invest_projects)  }
    end
  end
  
  def manage
    @build_objects = current_user.build_objects
    #@nodes = Node.joins(:sell).where(build_objects: { user_id: current_user })
    @nodes = Node.joins(:sell).where(sell: { user_id: current_user })
    @incoming_request_for_exhange = BuildObject.actual.includes(:nodes).where("user_id = ? AND nodes.id IS NOT NULL AND nodes.status != 2",current_user)
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
         send_data report#, filename: "#{@build_object.id}_#{report}.pdf", type: "application/pdf", disposition: "inline" 
      end
    end
  end

  # GET /build_objects/new
  # GET /build_objects/new.json
  def new
    @build_object = BuildObject.new
    @sale_type = params[:sale_type]
    if params[:sale_type] == 'chaining_sale'
      redirect_to controller: :nodes, action: :new 
      return true
    end
    #@ability_creating_buildobject = true if enought_money? :create_build_object_price
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
    unless enought_money? :create_build_object_price
      render action: "new", notice: "У вас недостаточно средст на счету. Пожалуста, пополните кошелёк"
    else
      
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
  
  def sold
    @build_object = BuildObject.find(params[:id])
    @build_object.selled_at = params[:build_object][:selled_at]
    if @build_object.save!
      redirect_to @build_object, notice: "Объект продан!"
    end
  end
  
private
  def views_limit
    count = 0
    if current_user
       return true if BuildObject.find(params[:id]).user == current_user #автору объекта просмотры не ограничены
       return true if current_user.rating > 3
      count = Impression.where(user_id: current_user).size if current_user.rating <= 1
    elsif request.remote_ip
      count = Impression.where(ip_address: request.remote_ip).size
    end
    if count > Variables.where(key: "max_views_limit_user_low_rating").first_or_create.value.to_i
      flash[:notice] =  %Q[Закончился лимит бесплатных просмотров. Пожалуйста, увеличьте Ваш рейтинг  <a href=#{new_payment_path}>Пополнить</a>].html_safe
      redirect_to action: "index" 
    end
  end
end

class NodesController < ApplicationController
  load_and_authorize_resource except: [:create, :new]
  # GET /nodes
  # GET /nodes.json
  def index
    @nodes = Node.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nodes }
    end
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
    @node = Node.find(params[:id])
    @matched_build_objects = BuildObject.actual.where("user_id != ?", current_user)
    @matched_nodes = Node.includes(:sell).where("build_objects.user_id != ?", current_user).matched_by_node @node
    @matched_build_objects.filter_min_price(@node.min_price).filter_max_price(@node.max_price)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @node }
    end
  end

  # GET /nodes/new
  # GET /nodes/new.json
  def new
    @node = Node.new
    @node.addresses.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @node }
    end
  end

  # GET /nodes/1/edit
  def edit
    @node = Node.find(params[:id])
  end

  # POST /nodes
  # POST /nodes.json
  def create
    @node = Node.new(params[:node])

    respond_to do |format|
      if @node.save!
        format.html { redirect_to @node, notice: 'Встречная продажа создана' }
        format.json { render json: @node, status: :created, location: @node }
      else
        format.html { render action: "new" }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nodes/1
  # PUT /nodes/1.json
  def update
    @node = Node.find(params[:id])

    respond_to do |format|
      if @node.update_attributes(params[:node])
        format.html { redirect_to @node, notice: 'Встречная продажа обновлена' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nodes/1
  # DELETE /nodes/1.json
  def destroy
    @node = Node.find(params[:id])
    @node.destroy

    respond_to do |format|
      format.html { redirect_to nodes_url }
      format.json { head :no_content }
    end
  end
  
  def exchange
    @node = Node.find(params[:id])
    @node.request_for_exchange BuildObject.find(params[:build_object])
    if @node.save
      redirect_to @node, notice: "Предложение обмена подано"
    else
      render action: :new
    end
  end
  
  def exchange_by_node
    @node = Node.find(params[:id])
    @node.request_for_exchange_by_node Node.find(params[:node])
    if @node.save
      redirect_to @node, notice: "Предложение обмена подано"
    else
      render action: :new
    end
  end
  
  def approve
    @node = Node.find params[:id]
    @contragent_node = Node.find params[:node]
    @node.accept_request_for_exchange_by_node! @contragent_node
    if @node.save!
      redirect_to @node, notice: "Обмен совершён"
    end
  end
end

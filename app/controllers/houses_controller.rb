class HousesController < ApplicationController
  # GET /promos
    # GET /promos.json
    def index
      @houses = House.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @houses }
      end
    end

    # GET /promos/1
    # GET /promos/1.json
    def show
      @house = House.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @house }
      end
    end

    # GET /promos/new
    # GET /promos/new.json
    def new
      @house = House.new
      @house.photos.build
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @house }
      end
    end

    # GET /promos/1/edit
    def edit
      @house = House.find(params[:id])
    end

    # POST /promos
    # POST /promos.json
    def create
      @house = House.new(params[:promo])
      respond_to do |format|
        if @house.save
          format.html { redirect_to @house, notice: 'House was successfully created.' }
          format.json { render json: @house, status: :created, location: @house }
        else
          format.html { render action: "new" }
          format.json { render json: @house.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /promos/1
    # PUT /promos/1.json
    def update
      @house = House.find(params[:id])
      respond_to do |format|
        if @house.update_attributes(params[:promo])
          format.html { redirect_to @house, notice: 'House was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @house.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /promos/1
    # DELETE /promos/1.json
    def destroy
      @house = House.find(params[:id])
      @house.destroy

      respond_to do |format|
        format.html { redirect_to promos_url }
        format.json { head :no_content }
      end
    end
end

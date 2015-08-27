class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :edit, :update, :destroy, :map, :filter]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  respond_to :html, :js

  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.all.paginate(page: params[:page], per_page: 20).order("name")
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
    @all_locations = @region.locations.limit(100).includes(:stat, :regions)
    @locations = @all_locations.paginate(page: params[:page], per_page: 12).order("name")
    @map_locations = @all_locations.map {|l| l.map_data}
  end

  # GET /regions/new
  def new
    @region = Region.new
  end

  # GET /regions/1/edit
  def edit
  end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regions/1
  # PATCH/PUT /regions/1.json
  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def map
    @map_locations = @region.locations.map {|l| l.map_data}
  end

  def filter
    @filter = params[:q]
    @all_locations = @region.locations.send(@filter).limit(12).includes(:stat, :regions)
    @locations = @all_locations.paginate(page: params[:page], per_page: 12).order("name")
    @map_locations = @all_locations.map {|l| l.map_data}
    render :show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find_by_permalink(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(:name)
    end
end

class RegionsController < ApplicationController
  before_action :set_region, only: [:show, :edit, :update, :destroy, :map, :filter, :map_data]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @regions = Region.all.paginate(page: params[:page], per_page: 20).order("name").includes(:locations)
  end

  def show
    @locations = @region.locations.order("anchor_count DESC").paginate(page: params[:page], per_page: 12).includes(:stat, :regions)
  end

  # GET /regions/new
  def new
    @region = Region.new
  end

  def edit
  end

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

  def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def map
  end

  def map_data
    @locations = @region.locations.includes(:stat)
  end

  def filter
    @filter = params[:q]
    @locations = @region.locations.send(@filter).limit(12).includes(:stat, :regions).paginate(page: params[:page], per_page: 12).order("name")
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

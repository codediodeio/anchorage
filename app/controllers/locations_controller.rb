class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy, :images, :map, :forecast, :map_data]
  before_action :authenticate_admin!, only: [:destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  after_action :badge_check, only: [:create]

  def index
    @locations = Location.all.includes(:regions, :stat).paginate(page: params[:page], per_page: 20).order("anchor_count DESC")
  end

  def show
    @user = current_user
    @regions = @location.regions.pluck(:name)
    @images = @location.images.limit(10).order('created_at DESC').includes(:user)
    @experiences = @location.experiences.order("anchors_count DESC").order('created_at DESC').includes(user: [sash: [:badges_sashes]])
    @near_locations = @location.stat.near
    arr = (@experiences + @images).sort_by { |m| m.anchors_count }
    @masons = arr.paginate(page: params[:page], per_page: 12)
    @paginate = true
  end

  # GET /locations/new
  def new
    @location = Location.new
    @stat = @location.build_stat
    @coords = [34.170890, -119.223149] # channel islands default
    @regions = Region.all.includes(:locations, :sub_regions).order('name')
    @opts = @regions.where(parent_id: nil)
  end

  def edit
    @regions = Region.all.includes(:locations, :sub_regions).order('name')
    @opts = @regions.where(parent_id: nil)
    @coords = [@location.stat.lat, @location.stat.long]
  end

  def create
    @user  = current_user
    @location = @user.locations.build(location_params)
    @regions = Region.all.includes(:locations)
    @opts = @regions.where(parent_id: nil)
    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @user  = current_user
    @regions = Region.all.includes(:locations)
    @opts = @regions.where(parent_id: nil)

    # params[:location][:region_ids].reject!(&:empty?)

    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autocomplete
    @locations = Location.where('name ILIKE ?', "%#{params[:query]}%").limit(6)
    @regions = Region.where('name ILIKE ?', "%#{params[:query]}%").limit(6)
  end

  def map
  end

  def map_data
    @spots = @location.experiences.where.not(lat: nil).where.not(long: nil)
  end

  def forecast
    @forecast = ForecastIO.forecast(@location.stat.lat, @location.stat.long)
    @offset = @forecast.offset
    @now = @forecast.currently
    @hour = @forecast.hourly.data
    @day = @forecast.daily.data
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.includes(:stat).find_by_permalink(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, region_ids: [], stat_attributes: [:lat, :long, :description, :fuel, :slips, :moorings, :integer, :protection, :ltype, :cost, :protection, :pstart, :pend, :latd, :longd])
    end
end

class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy, :images, :map, :forecast]
  before_action :authenticate_admin!, only: [:destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  after_action :badge_check, only: [:create]

  def index
    @locations = Location.all.paginate(page: params[:page], per_page: 20)
  end

  def images
    @images = @location.images.paginate(page: params[:page], per_page: 12).order('anchors_count DESC')
  end

  def show
    @user = current_user
    @regions = @location.regions.pluck(:name)
    @thumb_images = @location.images.limit(10).order('created_at DESC').includes(:user)
    @images = @thumb_images.paginate(page: params[:page], per_page: 3).order('anchors_count DESC').order('created_at DESC')
    @experiences = @location.experiences.order("anchors_count DESC").order('created_at DESC').includes(user: [sash: [:badges_sashes]])
    @near_locations = @location.stat.near
  end

  # GET /locations/new
  def new
    @regions = Region.all.includes(:locations)
    @location = Location.new
    @stat = @location.build_stat
  end

  def edit
    @regions = Region.all
  end

  def create
    @user  = current_user
    @regions = Region.all.includes(:locations)
    @location = @user.locations.build(location_params)
    # @stat = @location.build_stat(location_params[:stat])
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

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update

    @user  = current_user
    @regions = Region.all.includes(:locations)

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

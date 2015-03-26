class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @user = current_user
    @images = @location.images.paginate(page: params[:page], per_page: 3).order('anchors_count DESC')
    @experiences = @location.experiences.order("anchors_count DESC")
  end

  # GET /locations/new
  def new
    @regions = Region.all
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
    @regions = Region.all
  end

  # POST /locations
  # POST /locations.json
  def create
    @regions = Region.all
    @location = Location.new(location_params)

    if params[:regions]
      @location_regions = Region.find(params[:regions])
    else
      @location_regions = []
    end

    @location.regions = @location_regions



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

    @regions = Region.all
    if params[:regions]
      @location_regions = Region.find(params[:regions])
    else
      @location_regions = []
    end
    @location.regions = @location_regions

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
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :regions)
    end
end

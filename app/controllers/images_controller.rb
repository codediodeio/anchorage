class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  after_action :badge_check, only: [:update, :create, :destroy]

  respond_to :html, :js


  def index
    @location = Location.find_by_permalink(params[:location_id])
    @images = @location.images.includes(:user).paginate(page: params[:page], per_page: 12).order('anchors_count DESC')
  end

  def show
  end

  # GET /images/new
  def new
    @image = Image.new
    @location = Location.find_by_permalink(params[:location_id])
  end

  # GET /images/1/edit
  # def edit
  #   @user = @image.user
  #   @location = Location.find(params[:location_id])
  # end

  # POST /images
  # POST /images.json
  def create
    @user = current_user
    @image = @user.images.build(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image.location, notice: 'Image was uploaded successfully!' }
        format.json { render :show, status: :created, location: @image }
        format.js
      else
        format.html { redirect_to @image.location, notice: 'Image could not be uploaded! Please try again.'}
        format.json { render json: @image.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  # def update
  #   @user = @image.user
  #   respond_to do |format|
  #     if @image.update(image_params)
  #       format.html { redirect_to @image, notice: 'Image was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @image }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @image.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    if @image.user == current_user
      @image.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_path, notice: 'Image was successfully destroyed.' }
        format.json { head :no_content }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:file, :description, :user_id, :location_id)
    end

end

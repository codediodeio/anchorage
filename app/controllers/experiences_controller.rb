class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  after_action :badge_check, only: [:update, :create, :destroy]

  respond_to :html, :js

  # GET /experiences/new
  def new
    @experience = Experience.new
    @user = current_user
    @location = Location.find(params[:location_id])
  end

  # GET /experiences/1/edit
  def edit
    unless current_user == @experience.user || current_user.admin? == true
      redirect_to :back, alert: 'Not authorized to edit this content'
    end
    @user = current_user
    @location = @experience.location
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @user = current_user
    @experience = @user.experiences.build(experience_params)
    @location = Location.find(params[:experience][:location_id])

    respond_to do |format|
      if @experience.save
        format.js
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
      else
        format.js
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    unless current_user == @experience.user || current_user.admin? == true
      redirect_to :back, alert: 'Not authorized to edit this content'
    end
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:user_id, :location_id, :body, :lat, :long, :anchor_time)
    end
end

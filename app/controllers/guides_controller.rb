class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy, :print]
  before_action :authenticate_user!

  # GET /guides
  # GET /guides.json
  def index
    @guides = Guide.all
  end

  # GET /guides/1
  # GET /guides/1.json
  def show
    @user = current_user
    @regions = @guide.regions
    @pages = @guide.pages
    @page = @pages.first

      respond_to do |format|
      format.html
      format.pdf do
        pdf = GuidePdf.new(@guide)
        send_data pdf.render, filename: "#{@guide.name} | #{@guide.user.username}",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /guides/new
  def new
    @user = current_user
    @guide = Guide.new
  end

  # GET /guides/1/edit
  def edit
    @user = current_user
  end

  # POST /guides
  # POST /guides.json
  def create
    @user = current_user
    @guide = @user.guides.build(guide_params)

    respond_to do |format|
      if @guide.save
        format.html { redirect_to user_guide_path(id: @guide.permalink), notice: 'Guide was successfully created.' }
        format.json { render :show, status: :created, location: @guide }
      else
        format.html { redirect_to dashboard_path, alert: 'Unable to create guide due to missing or invalid name' }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guides/1
  # PATCH/PUT /guides/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @guide.update(guide_params)
        format.html { redirect_to user_guide_path(id: @guide.permalink), notice: 'Guide was successfully updated.' }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { redirect_to dashboard_path, alert: 'Unable to update guide due to missing or invalid name' }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1
  # DELETE /guides/1.json
  def destroy
    @guide.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: 'Guide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def print
    @user = current_user
    render layout: "blank"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = current_user.guides.find_by_permalink(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guide_params
      params.require(:guide).permit(:name, :user_id)
    end
end
